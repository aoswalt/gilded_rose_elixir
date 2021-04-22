defmodule GildedRose do
  @moduledoc """
  Documentation for `GildedRose`.
  """

  alias GildedRose.Item

  def update_inventory(items) when is_list(items) do
    items
    |> Enum.map(&Item.update/1)
    |> Enum.reject(&Item.worthless?/1)
  end

  @doc false
  def inspect_item(name, quality_value, opts) do
    import Inspect.Algebra

    value_doc = color(to_string(quality_value), :integer, opts)

    concat(["#", name, "<", value_doc, "g>"])
  end
end
