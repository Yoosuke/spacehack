# This file is responsible for configuring your application
# and its dependencies with the aid of the Mix.Config module.
#
# This configuration file is loaded before any dependency and
# is restricted to this project.

# General application configuration
use Mix.Config

config :spacehack,
  ecto_repos: [Spacehack.Repo]

# Configures the endpoint
config :spacehack, SpacehackWeb.Endpoint,
  url: [host: "localhost"],
  secret_key_base: "syJpg//WUnSYugdElHnqS09N4lluIEY/adAECg5d7Hg4VGVYFG827R5SX+zkX7JW",
  render_errors: [view: SpacehackWeb.ErrorView, accepts: ~w(html json), layout: false],
  pubsub_server: Spacehack.PubSub,
  live_view: [signing_salt: "OS4pQKPj"]

# Configures Elixir's Logger
config :logger, :console,
  format: "$time $metadata[$level] $message\n",
  metadata: [:request_id]

# Use Jason for JSON parsing in Phoenix
config :phoenix, :json_library, Jason

# Import environment specific config. This must remain at the bottom
# of this file so it overrides the configuration defined above.
import_config "#{Mix.env()}.exs"

# pow
config :spacehack, :pow,
  user: Spacehack.Users.User,
  repo: Spacehack.Repo,
  web_module: SpacehackWeb
