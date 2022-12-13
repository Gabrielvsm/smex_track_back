defmodule SmexTrack.SupplyFixtures do
  @moduledoc """
  This module defines test helpers for creating
  entities via the `SmexTrack.Supply` context.
  """

  @doc """
  Generate a supply_batch.
  """
  def supply_batch_fixture(attrs \\ %{}) do
    {:ok, supply_batch} =
      attrs
      |> Enum.into(%{
        date: ~D[2022-12-12],
        total_price: 120.5
      })
      |> SmexTrack.Supply.create_supply_batch()

    supply_batch
  end

  @doc """
  Generate a item.
  """
  def item_fixture(attrs \\ %{}) do
    {:ok, item} =
      attrs
      |> Enum.into(%{
        amount: 120.5,
        name: "some name",
        price: 120.5
      })
      |> SmexTrack.Supply.create_item()

    item
  end
end
