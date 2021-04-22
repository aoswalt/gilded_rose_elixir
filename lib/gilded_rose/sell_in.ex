defmodule GildedRose.SellIn do
  @enforce_keys [:days]
  defstruct @enforce_keys

  def new(days) when is_integer(days) and days > 0 do
    %__MODULE__{days: days}
  end

  def update(%__MODULE__{} = sell_in, change \\ -1) when is_integer(change) do
    %{sell_in | days: sell_in.days + change}
  end

  def expired?(%__MODULE__{days: days}), do: days <= 0

  def remaining(%__MODULE__{days: days}), do: days
end
