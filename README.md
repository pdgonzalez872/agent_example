# AgentExample

Playing with Agents.

## How to:

Go to `application.ex`. That's where we decide how boot will look like.
Feel free to change `AgentExample.create_a_bunch_of_agents(5_000)` to see how
the system behaves.

Call `AgentExample.get_state_for_agents()` to see the current state for all Agents.
Call `AgentExample.update_all_agents()` to update all agents, then call
`get_state_for_agents/0` again to verify.
