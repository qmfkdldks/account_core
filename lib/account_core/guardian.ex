defmodule AccountCore.Guardian do
  use Guardian, otp_app: :account_core

  alias AccountCore.Model

  def subject_for_token(user, _claims) do
    sub = to_string(user.id)
    {:ok, sub}
  end

  def subject_for_token(_, _) do
    {:error, :reason_for_error}
  end

  def resource_from_claims(claims) do
    id = claims["sub"]
    resource = Model.User.get!(id)
    {:ok,  resource}
  end

  def resource_from_claims(_claims) do
    {:error, :reason_for_error}
  end

  # def build_claims(claims, resource, _opts) do
  #   n_claims = Map.merge(claims, %{"additionakl" => "sadfdsf"})
  #   {:ok, n_claims}
  # end
end
