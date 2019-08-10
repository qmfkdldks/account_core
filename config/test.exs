use Mix.Config

# Configure your database
config :account_core, AccountCore.Repo,
  username: "liar",
  password: "007rkdqm",
  database: "accountcore_test",
  hostname: "localhost",
  pool: Ecto.Adapters.SQL.Sandbox

# Print only warnings and errors during test
config :logger, level: :warn

# Auth Secret Key
config :account_core, AccountCore.Guardian,
  issuer: "account_core",
  secret_key: "1Di0BLNANkPPqAbdcM60Gi2iuyPTvdZxtY8W5Apd3GfgeE/O8307J4qeEheoVQY6"

