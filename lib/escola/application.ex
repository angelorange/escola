defmodule Escola.Application do
  # See https://hexdocs.pm/elixir/Application.html
  # for more information on OTP Applications
  @moduledoc false

  use Application

  @impl true
  def start(_type, _args) do
    children = [
      # Start the Ecto repository
      Escola.Repo,
      # Start the Telemetry supervisor
      EscolaWeb.Telemetry,
      # Start the PubSub system
      {Phoenix.PubSub, name: Escola.PubSub},
      # Start the Endpoint (http/https)
      EscolaWeb.Endpoint
      # Start a worker by calling: Escola.Worker.start_link(arg)
      # {Escola.Worker, arg}
    ]

    # See https://hexdocs.pm/elixir/Supervisor.html
    # for other strategies and supported options
    opts = [strategy: :one_for_one, name: Escola.Supervisor]
    Supervisor.start_link(children, opts)
  end

  # Tell Phoenix to update the endpoint configuration
  # whenever the application is updated.
  @impl true
  def config_change(changed, _new, removed) do
    EscolaWeb.Endpoint.config_change(changed, removed)
    :ok
  end
end
