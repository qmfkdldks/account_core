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

import_config "test.secret.exs"
