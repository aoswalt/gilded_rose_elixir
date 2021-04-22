defmodule GildedRose.Item.AgedBrie do
  @enforce_keys [:sell_in, :quality]
  defstruct @enforce_keys

  alias __MODULE__
  alias GildedRose.Quality
  alias GildedRose.SellIn

  def new(sell_in, quality) do
    %AgedBrie{
      sell_in: SellIn.new(sell_in),
      quality: Quality.new(quality)
    }
  end

  defimpl GildedRose.Item do
    def update(%AgedBrie{} = item) do
      new_sell_in = SellIn.update(item.sell_in)
      new_quality = Quality.update(item.quality, +1)

      %{item | sell_in: new_sell_in, quality: new_quality}
    end

    def worthless?(%AgedBrie{} = item), do: Quality.worthless?(item.quality)
  end

  defimpl Inspect do
    def inspect(%AgedBrie{} = item, opts) do
      GildedRose.inspect_item("AgedBrie", Quality.value(item.quality), opts)
    end
  end
end
