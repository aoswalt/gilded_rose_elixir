defmodule GildedRose.Item.Sulfuras do
  defstruct []

  alias __MODULE__
  alias GildedRose.Quality

  def new(), do: %Sulfuras{}

  defimpl GildedRose.Item do
    def update(%Sulfuras{}), do: %Sulfuras{}
    def worthless?(%Sulfuras{}), do: false
  end

  defimpl Inspect do
    def inspect(%Sulfuras{}, opts) do
      GildedRose.inspect_item("Sulfuras", Quality.value(Quality.legendary()), opts)
    end
  end
end
