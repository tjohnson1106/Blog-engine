# This file is responsible for configuring your application
# and its dependencies with the aid of the Mix.Config module.
#
# This configuration file is loaded before any dependency and
# is restricted to this project.

# General application configuration
use Mix.Config

config :engine,
  ecto_repos: [Engine.Repo]

# Configures the endpoint
config :engine, EngineWeb.Endpoint,
  url: [host: "localhost"],
  secret_key_base: "ejnrFjteQ54jUT6ywA2WJLCo+FEVm89tmjX1/kxyULydjt9lT6aEqGDw5/km1lO8",
  render_errors: [view: EngineWeb.ErrorView, accepts: ~w(html json)],
  pubsub: [name: Engine.PubSub, adapter: Phoenix.PubSub.PG2]

# Configures Elixir's Logger
config :logger, :console,
  format: "$time $metadata[$level] $message\n",
  metadata: [:request_id]

# Use Jason for JSON parsing in Phoenix
config :phoenix, :json_library, Jason

# Import environment specific config. This must remain at the bottom
# of this file so it overrides the configuration defined above.
import_config "#{Mix.env()}.exs"
