# This file is responsible for configuring your application
# and its dependencies with the aid of the Mix.Config module.
#
# This configuration file is loaded before any dependency and
# is restricted to this project.

# General application configuration
use Mix.Config

config :account_core, ecto_repos: [AccountCore.Repo]

# Configures Elixir's Logger
# config :logger, :console,
#   format: "$time $metadata[$level] $message\n",
#   metadata: [:request_id]

# Internal Configuration
# reset password token length
config :account_core, :reset_token_length, 6

# Import environment specific config. This must remain at the bottom
# of this file so it overrides the configuration defined above.
import_config "#{Mix.env()}.exs"
