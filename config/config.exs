# This file is responsible for configuring your application
# and its dependencies with the aid of the Mix.Config module.
#
# This configuration file is loaded before any dependency and
# is restricted to this project.

# General application configuration
use Mix.Config

config :users_management,
  ecto_repos: [UsersManagement.Repo]

config :users_management, UsersManagement.Repo,
  migration_primary_key: [type: :binary_id],
  migration_foreign_key: [type: :binary_id]

# Configures the endpoint
config :users_management, UsersManagementWeb.Endpoint,
  url: [host: "localhost"],
  secret_key_base: "BeHSlFr3KdjD+PKl5GXCLrln23yFE0RG4UzoPE8MZ4haoxiIwT3Vdm/4gt+wFKl3",
  render_errors: [view: UsersManagementWeb.ErrorView, accepts: ~w(json), layout: false],
  pubsub_server: UsersManagement.PubSub,
  live_view: [signing_salt: "YKx/9sYa"]

# Configures Elixir's Logger
config :logger, :console,
  format: "$time $metadata[$level] $message\n",
  metadata: [:request_id]

# Use Jason for JSON parsing in Phoenix
config :phoenix, :json_library, Jason

# Import environment specific config. This must remain at the bottom
# of this file so it overrides the configuration defined above.
import_config "#{Mix.env()}.exs"
