defmodule Handler.Application do
  # See https://hexdocs.pm/elixir/Application.html
  # for more information on OTP Applications
  @moduledoc false

  use Application

  def start(_type, _args) do
    children = [
      # Start the Telemetry supervisor
      HandlerWeb.Telemetry,
      # Start the PubSub system
      {Phoenix.PubSub, name: Handler.PubSub},
      # Start the Endpoint (http/https)
      HandlerWeb.Endpoint
      # Start a worker by calling: Handler.Worker.start_link(arg)
      # {Handler.Worker, arg}
    ]

    # See https://hexdocs.pm/elixir/Supervisor.html
    # for other strategies and supported options
    opts = [strategy: :one_for_one, name: Handler.Supervisor]
    Supervisor.start_link(children, opts)
  end

  # Tell Phoenix to update the endpoint configuration
  # whenever the application is updated.
  def config_change(changed, _new, removed) do
    HandlerWeb.Endpoint.config_change(changed, removed)
    :ok
  end
end
