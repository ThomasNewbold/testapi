# This file is responsible for configuring your application
# and its dependencies with the aid of the Mix.Config module.
#
# This configuration file is loaded before any dependency and
# is restricted to this project.
use Mix.Config

# General application configuration
config :testapi,
  ecto_repos: [Testapi.Repo]

# Configures the endpoint
config :testapi, Testapi.Endpoint,
  url: [host: "localhost"],
  secret_key_base: "dJHrayLJ8gr9le9L6ytOL0ADUDNZLbwANVyrLWmKBWeA6Yyu2g3FkU/ZKGjNhOYN",
  render_errors: [view: Testapi.ErrorView, accepts: ~w(html json)],
  pubsub: [name: Testapi.PubSub,
           adapter: Phoenix.PubSub.PG2]

# Configures Elixir's Logger
config :logger, :console,
  format: "$time $metadata[$level] $message\n",
  metadata: [:request_id]

# Import environment specific config. This must remain at the bottom
# of this file so it overrides the configuration defined above.
import_config "#{Mix.env}.exs"
