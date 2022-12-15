defmodule SmexTrackWeb.ProductionBatchView do
  use SmexTrackWeb, :view
  alias SmexTrackWeb.ProductionBatchView

  def render("index.json", %{production_batches: production_batches}) do
    %{data: render_many(production_batches, ProductionBatchView, "production_batch.json")}
  end

  def render("show.json", %{production_batch: production_batch}) do
    %{data: render_one(production_batch, ProductionBatchView, "production_batch.json")}
  end

  def render("production_batch.json", %{production_batch: production_batch}) do
    %{
      id: production_batch.id
    }
  end
end
