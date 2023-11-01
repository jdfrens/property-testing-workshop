defmodule PropertyTestingTest do
  use ExUnit.Case
  doctest PropertyTesting

  test "greets the world" do
    assert PropertyTesting.hello() == :world
  end
end
