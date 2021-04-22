defmodule GildedRoseTest do
  use ExUnit.Case
  doctest GildedRose

  test "greets the world" do
    assert GildedRose.hello() == :world
  end
end
