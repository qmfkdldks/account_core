defmodule AccountCore.Application do
  use Application

  def start(_type, _args) do
    # List all child processes to be supervised
    children = [
      AccountCore.Repo,
      # Start the endpoint when the application starts
    ]

    # See https://hexdocs.pm/elixir/Supervisor.html
    # for other strategies and supported options
    opts = [strategy: :one_for_one, name: AccountCore.Supervisor]
    Supervisor.start_link(children, opts)
  end
end
