defmodule Spacehack.Application do
  # See https://hexdocs.pm/elixir/Application.html
  # for more information on OTP Applications
  @moduledoc false

  use Application

  def start(_type, _args) do
    children = [
      # Start the Ecto repository
      Spacehack.Repo,
      # Start the Telemetry supervisor
      SpacehackWeb.Telemetry,
      # Start the PubSub system
      {Phoenix.PubSub, name: Spacehack.PubSub},
      # Start the Endpoint (http/https)
      SpacehackWeb.Endpoint
      # Start a worker by calling: Spacehack.Worker.start_link(arg)
      # {Spacehack.Worker, arg}
    ]

    # See https://hexdocs.pm/elixir/Supervisor.html
    # for other strategies and supported options
    opts = [strategy: :one_for_one, name: Spacehack.Supervisor]
    Supervisor.start_link(children, opts)
  end

  # Tell Phoenix to update the endpoint configuration
  # whenever the application is updated.
  def config_change(changed, _new, removed) do
    SpacehackWeb.Endpoint.config_change(changed, removed)
    :ok
  end
end
