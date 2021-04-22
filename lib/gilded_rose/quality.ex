defmodule GildedRose.Quality do
  @enforce_keys [:value]
  defstruct @enforce_keys

  def new(value) when is_integer(value) do
    value =
      cond do
        value < 0 -> 0
        value > 50 -> 50
        true -> value
      end

    %__MODULE__{value: value}
  end

  def legendary(), do: %__MODULE__{value: 80}

  def update(%__MODULE__{} = quality, change \\ -1) when is_integer(change) do
    new(quality.value + change)
  end

  def value(%__MODULE__{value: value}), do: value

  def worthless?(%__MODULE__{value: value}), do: value == 0
end
