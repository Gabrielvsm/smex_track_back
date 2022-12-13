defmodule SmexTrack.ProductionFixtures do
  @moduledoc """
  This module defines test helpers for creating
  entities via the `SmexTrack.Production` context.
  """

  @doc """
  Generate a production_batch.
  """
  def production_batch_fixture(attrs \\ %{}) do
    {:ok, production_batch} =
      attrs
      |> Enum.into(%{
        date: ~D[2022-12-12],
        total_cost: 120.5
      })
      |> SmexTrack.Production.create_production_batch()

    production_batch
  end

  @doc """
  Generate a production_item.
  """
  def production_item_fixture(attrs \\ %{}) do
    {:ok, production_item} =
      attrs
      |> Enum.into(%{
        amount: 120.5,
        price_by_amount: 120.5
      })
      |> SmexTrack.Production.create_production_item()

    production_item
  end

  @doc """
  Generate a product.
  """
  def product_fixture(attrs \\ %{}) do
    {:ok, product} =
      attrs
      |> Enum.into(%{
        name: "some name",
        price: 120.5
      })
      |> SmexTrack.Production.create_product()

    product
  end
end
