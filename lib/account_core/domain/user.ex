defmodule AccountCore.Domain.User do
  @moduledoc """
  Account keeps the contexts that define your domain
  and business logic.

  Contexts are also responsible for managing your data, regardless
  if it comes from the database, an external API or others.
  """

  import Ecto.Query, warn: false

  import AccountCore.ErrorHelpers

  alias AccountCore.{Schema, Model}
  alias AccountCore.Guardian
  import Comeonin.Bcrypt, only: [checkpw: 2]

  @reset_token_length Application.fetch_env!(:account_core, :reset_token_length)

  @doc """
  Returns token and additional properties
  """
  def sign_in(email, password) do
    case email_password_auth(email, password) do
      {:ok, user} ->
        Guardian.encode_and_sign(user, %{"some" => "fdf"})

      _ ->
        {:error, :unauthorized}
    end
  end

  @doc """
  Create new user given attributes
  """
  def sign_up(attrs \\ %{}) do
    case Model.User.create(attrs) do
      {:ok, user} -> {:ok, user}
      {:error, changeset} -> {:error, parse_errors(changeset)}
    end
  end

  @doc """
  Update given user with attributes
  """
  def update(user, attrs \\ %{}) do
    case Model.User.update(user, attrs) do
      {:ok, user} -> {:ok, user}
      {:error, changeset} -> {:error, parse_errors(changeset)}
    end
  end

  @doc """
  Generate reset_password_token and send email

  email not exist
  sent successful
  """
  def get_reset_password_token(user) do
    token = random_token(@reset_token_length)

    case Model.User.update(user, %{ "reset_password_token" => token, "reset_password_sent_at" => DateTime.utc_now }) do
      {:ok, user} -> {:ok, token}
      {:error, changeset} -> {:error, parse_errors(changeset)}
    end
  end

  def reset_password(user) do

  end

  # Private
  defp random_token(length) do
    :crypto.strong_rand_bytes(length) |> Base.url_encode64 |> binary_part(0, length)
  end

  defp email_password_auth(email, password) do
    with {:ok, user} <- Model.User.get_by_email(email),
         do: verify_password(password, user)
  end

  defp verify_password(password, %Schema.User{} = user) when is_binary(password) do
    if checkpw(password, user.password_hash) do
      {:ok, user}
    else
      {:error, :invalid_password}
    end
  end
end
