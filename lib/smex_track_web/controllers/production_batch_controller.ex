defmodule SmexTrackWeb.ProductionBatchController do
  use SmexTrackWeb, :controller

  alias SmexTrack.Production
  alias SmexTrack.Production.ProductionBatch

  action_fallback SmexTrackWeb.FallbackController

  def index(conn, _params) do
    production_batches = Production.list_production_batches()
    render(conn, "index.json", production_batches: production_batches)
  end

  def create(conn, %{"production_batch" => production_batch_params}) do

    with {:ok, %ProductionBatch{} = production_batch} <- Production.create_production_batch(production_batch_params) do
      conn
      |> put_status(:created)
      |> put_resp_header("location", Routes.production_batch_path(conn, :show, production_batch))
      |> render("show.json", production_batch: production_batch)
    end
  end

  def show(conn, %{"id" => id}) do
    production_batch = Production.get_production_batch!(id)
    render(conn, "show.json", production_batch: production_batch)
  end

  def update(conn, %{"id" => id, "production_batch" => production_batch_params}) do
    production_batch = Production.get_production_batch!(id)

    with {:ok, %ProductionBatch{} = production_batch} <- Production.update_production_batch(production_batch, production_batch_params) do
      render(conn, "show.json", production_batch: production_batch)
    end
  end

  def delete(conn, %{"id" => id}) do
    production_batch = Production.get_production_batch!(id)

    with {:ok, %ProductionBatch{}} <- Production.delete_production_batch(production_batch) do
      send_resp(conn, :no_content, "")
    end
  end
end
