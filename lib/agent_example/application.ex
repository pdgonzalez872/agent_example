defmodule AgentExample.Application do
  # See https://hexdocs.pm/elixir/Application.html
  # for more information on OTP Applications
  @moduledoc false

  use Application

  def start(_type, _args) do
    children = [
    ]

    # create this group so agents can join
    :ok = :pg2.create(:agent_group)

    # create the agents, can try with 5_000 of them, even with 200k!
    # (That will take a little bit)
    AgentExample.create_a_bunch_of_agents(5_000)

    # boot up `iex` like this: `iex -S mix` and call
    # `AgentExample.get_state_for_agents()`
    # to get their state

    opts = [strategy: :one_for_one, name: AgentExample.Supervisor]
    Supervisor.start_link(children, opts)
  end
end
