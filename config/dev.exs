use Mix.Config

# Configure your database
config :account_core, AccountCore.Repo,
  username: "liar",
  password: "007rkdqm",
  database: "accountcore_dev",
  hostname: "localhost",
  pool_size: 10

# Do not include metadata nor timestamps in development logs
config :logger, :console, format: "[$level] $message\n"

# configuration from environment variables.
# import_config "dev.secret.exs"
