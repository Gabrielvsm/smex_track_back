defmodule SmexTrackWeb.SupplyBatchController do
  use SmexTrackWeb, :controller

  alias SmexTrack.Supply
  alias SmexTrack.Supply.SupplyBatch
  alias SmexTrack.Supply.Item

  action_fallback SmexTrackWeb.FallbackController

  def index(conn, _params) do
    supply_batches = Supply.list_supply_batches()
    render(conn, "index.json", supply_batches: supply_batches)
  end

  def create(conn, %{"supply_batch" => supply_batch_params}) do
    if !Map.has_key?(supply_batch_params, "items"), do: render(conn, "error.json", error: "Missing items")
    if !Item.changeset(%Item{}, List.first(supply_batch_params["items"])).valid? do
      render(conn, "error.json", error: "Missing fields from items")
    end

    with {:ok, %SupplyBatch{} = supply_batch} <- Supply.create_supply_batch(supply_batch_params) do
      Enum.each(supply_batch_params["items"], &Supply.create_item(&1, supply_batch))

      # TODO: update to use concurrency
      total_price = calculate_total_price supply_batch.id
      Supply.update_supply_batch(supply_batch, %{total_price: total_price})
      supply_batch = Supply.get_supply_batch! supply_batch.id

      conn
      |> put_status(:created)
      |> put_resp_header("location", Routes.supply_batch_path(conn, :show, supply_batch))
      |> render("show.json", supply_batch: supply_batch)
    end
  end

  # Iterates through the items associated with the supply batch
  # and sums their price up
  defp calculate_total_price(supply_batch_id) do
      Supply.get_supply_batch!(supply_batch_id).items
      |> Enum.map(&(&1.price))
      |> Enum.reduce(fn x, acc -> x + acc end)
  end

  def show(conn, %{"id" => id}) do
    supply_batch = Supply.get_supply_batch!(id)
    render(conn, "show.json", supply_batch: supply_batch)
  end

  # TODO: update items together when needed
  def update(conn, %{"id" => id, "supply_batch" => supply_batch_params}) do
    supply_batch = Supply.get_supply_batch!(id)

    with {:ok, %SupplyBatch{} = supply_batch} <- Supply.update_supply_batch(supply_batch, supply_batch_params) do
      render(conn, "show.json", supply_batch: supply_batch)
    end
  end

  # TODO: adjust the the delete_all not working
  def delete(conn, %{"id" => id}) do
    supply_batch = Supply.get_supply_batch!(id)

    with {:ok, %SupplyBatch{}} <- Supply.delete_supply_batch(supply_batch) do
      send_resp(conn, :no_content, "")
    end
  end
end
