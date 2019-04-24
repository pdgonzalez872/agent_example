defmodule AgentExample do

  def create_a_bunch_of_agents(upper_bound) do
    Enum.each(0..upper_bound, fn el ->
      name = "#{el}some_random_uuid"
      state = %{my_name_is: name, can_party: true, updates: 0}
      {:ok, pid} = Agent.start_link(fn -> state end, name: {:global, {:user, name}})
      :pg2.join(:agent_group, pid)
    end)
  end

  def get_state_for_agents() do
    :pg2.get_local_members(:agent_group)
    |> Enum.each(fn member ->
      member
      |> Agent.get(fn state -> state end)
      |> IO.inspect()
    end)
  end

  def update_all_agents() do
    :pg2.get_local_members(:agent_group)
    |> Enum.each(fn member ->
      member
      |> Agent.update(fn state ->
        Map.put(state, :updates, state.updates + 1)
      end)
    end)
  end
end
