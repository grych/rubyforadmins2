defmodule Rubyforadmins2.Application do
  # See https://hexdocs.pm/elixir/Application.html
  # for more information on OTP Applications
  @moduledoc false
  alias Rubyforadmins2.Chapter
  use Application

  @impl true
  def start(_type, _args) do
    children = [
      # Start the Telemetry supervisor
      Rubyforadmins2Web.Telemetry,
      # Start the PubSub system
      {Phoenix.PubSub, name: Rubyforadmins2.PubSub},
      # Start the Chapter
      {Chapter, Chapter.get_chapters()},
      # Start the Endpoint (http/https)
      Rubyforadmins2Web.Endpoint
      # Start a worker by calling: Rubyforadmins2.Worker.start_link(arg)
      # {Rubyforadmins2.Worker, arg}
    ]

    # See https://hexdocs.pm/elixir/Supervisor.html
    # for other strategies and supported options
    opts = [strategy: :one_for_one, name: Rubyforadmins2.Supervisor]
    Supervisor.start_link(children, opts)
  end

  # Tell Phoenix to update the endpoint configuration
  # whenever the application is updated.
  @impl true
  def config_change(changed, _new, removed) do
    Rubyforadmins2Web.Endpoint.config_change(changed, removed)
    :ok
  end
end
