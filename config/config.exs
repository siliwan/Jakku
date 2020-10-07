# This file is responsible for configuring your umbrella
# and **all applications** and their dependencies with the
# help of the Config module.
#
# Note that all applications in your umbrella share the
# same configuration and dependencies, which is why they
# all use the same configuration file. If you want different
# configurations or dependencies per app, it is best to
# move said applications out of the umbrella.
import Config

# Emacs settings
# filter = possible extra filters and emacs commands.
config :interface,
  path: "~/.emacs.d/init.el",
  time: "month",
  letter: "a",
  filter: ""

# Sample configuration:
#
#     config :logger, :console,
#       level: :info,
#       format: "$date $time [$level] $metadata$message\n",
#       metadata: [:user_id]
#

# Configures the endpoint
config :handler, HandlerWeb.Endpoint,
  url: [host: "localhost"],
  secret_key_base: "ALcYThi+HR6fPglxl1SEPjoaXYffApO1dgDnli6UwTzj/89oTUFwEscB/+ET0fSg",
  render_errors: [view: HandlerWeb.ErrorView, accepts: ~w(html json), layout: false],
  pubsub_server: Handler.PubSub,
  live_view: [signing_salt: "UFACOKy9"]

# Configures Elixir's Logger
config :logger, :console,
  format: "$time $metadata[$level] $message\n",
  metadata: [:request_id]

# Use Jason for JSON parsing in Phoenix
config :phoenix, :json_library, Jason

# Import environment specific config. This must remain at the bottom
# of this file so it overrides the configuration defined above.
import_config "#{Mix.env()}.exs"
