defmodule AgentExampleTest do
  use ExUnit.Case
  doctest AgentExample

  test "greets the world" do
    assert AgentExample.hello() == :world
  end
end
