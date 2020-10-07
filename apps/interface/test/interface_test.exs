defmodule InterfaceTest do
  use ExUnit.Case
  doctest Interface

  test "greets the world" do
    assert Interface.hello() == :world
  end
end
