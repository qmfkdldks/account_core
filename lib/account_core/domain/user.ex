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

  # Private

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
