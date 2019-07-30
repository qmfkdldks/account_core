defmodule AccountCore.Repo do
  use Ecto.Repo,
    otp_app: :account_core,
    adapter: Ecto.Adapters.Postgres
end
