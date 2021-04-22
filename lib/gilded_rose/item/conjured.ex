defmodule GildedRose.Item.Conjured do
  @enforce_keys [:name, :sell_in, :quality]
  defstruct @enforce_keys

  alias __MODULE__
  alias GildedRose.Quality
  alias GildedRose.SellIn

  def new(name, sell_in, quality) when is_binary(name) do
    %Conjured{
      name: name,
      sell_in: SellIn.new(sell_in),
      quality: Quality.new(quality)
    }
  end

  defimpl GildedRose.Item do
    def update(%Conjured{} = item) do
      new_sell_in = SellIn.update(item.sell_in)

      new_quality =
        if SellIn.expired?(new_sell_in) do
          Quality.update(item.quality, -4)
        else
          Quality.update(item.quality, -2)
        end

      %{item | sell_in: new_sell_in, quality: new_quality}
    end

    def worthless?(%Conjured{} = item), do: Quality.worthless?(item.quality)
  end

  defimpl Inspect do
    def inspect(%Conjured{} = item, opts) do
      GildedRose.inspect_item("Conjured: " <> item.name, Quality.value(item.quality), opts)
    end
  end
end
