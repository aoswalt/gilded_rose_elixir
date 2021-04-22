defmodule GildedRose.Item.BackstagePass do
  @enforce_keys [:sell_in, :quality]
  defstruct @enforce_keys

  alias __MODULE__
  alias GildedRose.Quality
  alias GildedRose.SellIn

  def new(sell_in, quality) do
    %BackstagePass{
      sell_in: SellIn.new(sell_in),
      quality: Quality.new(quality)
    }
  end

  defimpl GildedRose.Item do
    def update(%BackstagePass{} = item) do
      new_sell_in = SellIn.update(item.sell_in)

      remaining = SellIn.remaining(new_sell_in)

      new_quality =
        cond do
          remaining <= 0 -> Quality.new(0)
          remaining <= 5 -> Quality.update(item.quality, +3)
          remaining <= 10 -> Quality.update(item.quality, +2)
          true -> Quality.update(item.quality)
        end

      %{item | sell_in: new_sell_in, quality: new_quality}
    end

    def worthless?(%BackstagePass{} = item), do: Quality.worthless?(item.quality)
  end

  defimpl Inspect do
    def inspect(%BackstagePass{} = item, opts) do
      GildedRose.inspect_item("BackstagePass", Quality.value(item.quality), opts)
    end
  end
end
