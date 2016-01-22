# This file is responsible for configuring your application
# and its dependencies with the aid of the Mix.Config module.
#
# This configuration file is loaded before any dependency and
# is restricted to this project.
use Mix.Config

# Configures the endpoint
config :exfile_sample, ExfileSample.Endpoint,
  url: [host: "localhost"],
  root: Path.dirname(__DIR__),
  secret_key_base: "/m3Qlhvm7NgBWBRtuS7WgQ9A+VBP1cy/NFu5Vluwp/szbDPpWL8ueNlrNLEEkL1v",
  render_errors: [accepts: ~w(html json)],
  pubsub: [name: ExfileSample.PubSub,
           adapter: Phoenix.PubSub.PG2]

# Configures Elixir's Logger
config :logger, :console,
  format: "$time $metadata[$level] $message\n",
  metadata: [:request_id]

# Import environment specific config. This must remain at the bottom
# of this file so it overrides the configuration defined above.
import_config "#{Mix.env}.exs"

# Configure phoenix generators
config :phoenix, :generators,
  migration: true,
  binary_id: false

config :exfile, Exfile,
  secret: "donttellanyone",
  backends: %{
    "store" => [Exfile.Backend.FileSystem, %{
      directory: Path.expand("./tmp/store"),
      max_size: nil,
      hasher: Exfile.Hasher.Random
    }],
    "cache" => [Exfile.Backend.FileSystem, %{
      directory: Path.expand("./tmp/cache"),
      max_size: nil,
      hasher: Exfile.Hasher.Random
    }]
  }
