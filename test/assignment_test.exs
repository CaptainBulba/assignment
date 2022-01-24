defmodule AssignmentTest do
  use ExUnit.Case
  doctest Assignment

  test "greets the world" do
    assert Assignment.hello() == :world
  end
end
