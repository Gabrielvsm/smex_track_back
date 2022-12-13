defmodule SmexTrackWeb.SupplyBatchView do
  use SmexTrackWeb, :view
  alias SmexTrackWeb.SupplyBatchView

  def render("index.json", %{supply_batches: supply_batches}) do
    %{data: render_many(supply_batches, SupplyBatchView, "supply_batch.json")}
  end

  def render("show.json", %{supply_batch: supply_batch}) do
    %{data: render_one(supply_batch, SupplyBatchView, "supply_batch.json")}
  end

  def render("supply_batch.json", %{supply_batch: supply_batch}) do
    %{
      id: supply_batch.id,
      date: supply_batch.date,
      total_price: supply_batch.total_price,
      items: list_items supply_batch.items
    }
  end

  def render("error.json", %{error: error}) do
    %{ error: error }
  end

  defp list_items(items) do
    Enum.map(items, &(
      %{
          id: &1.id,
          name: &1.name,
          price: &1.price,
          amount: &1.amount
        }
      ))
  end
end
