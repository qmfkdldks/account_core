use Mix.Config

# Configure your database
config :account_core, AccountCore.Repo,
  username: "liar",
  password: "007rkdqm",
  database: "account_core_dev",
  hostname: "localhost",
  pool_size: 10

# Do not include metadata nor timestamps in development logs
config :logger, :console, format: "[$level] $message\n"

# Auth Secret Key
config :account_core, AccountCore.Guardian,
  issuer: "account_core",
  secret_key: "1Di0BLNANkPPqAbdcM60Gi2iuyPTvdZxtY8W5Apd3GfgeE/O8307J4qeEheoVQY6"
