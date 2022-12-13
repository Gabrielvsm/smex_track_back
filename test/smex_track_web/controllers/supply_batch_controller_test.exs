defmodule SmexTrackWeb.SupplyBatchControllerTest do
  use SmexTrackWeb.ConnCase

  import SmexTrack.SupplyFixtures

  alias SmexTrack.Supply.SupplyBatch

  @create_attrs %{

  }
  @update_attrs %{

  }
  @invalid_attrs %{}

  setup %{conn: conn} do
    {:ok, conn: put_req_header(conn, "accept", "application/json")}
  end

  describe "index" do
    test "lists all supply_batches", %{conn: conn} do
      conn = get(conn, Routes.supply_batch_path(conn, :index))
      assert json_response(conn, 200)["data"] == []
    end
  end

  describe "create supply_batch" do
    test "renders supply_batch when data is valid", %{conn: conn} do
      conn = post(conn, Routes.supply_batch_path(conn, :create), supply_batch: @create_attrs)
      assert %{"id" => id} = json_response(conn, 201)["data"]

      conn = get(conn, Routes.supply_batch_path(conn, :show, id))

      assert %{
               "id" => ^id
             } = json_response(conn, 200)["data"]
    end

    test "renders errors when data is invalid", %{conn: conn} do
      conn = post(conn, Routes.supply_batch_path(conn, :create), supply_batch: @invalid_attrs)
      assert json_response(conn, 422)["errors"] != %{}
    end
  end

  describe "update supply_batch" do
    setup [:create_supply_batch]

    test "renders supply_batch when data is valid", %{conn: conn, supply_batch: %SupplyBatch{id: id} = supply_batch} do
      conn = put(conn, Routes.supply_batch_path(conn, :update, supply_batch), supply_batch: @update_attrs)
      assert %{"id" => ^id} = json_response(conn, 200)["data"]

      conn = get(conn, Routes.supply_batch_path(conn, :show, id))

      assert %{
               "id" => ^id
             } = json_response(conn, 200)["data"]
    end

    test "renders errors when data is invalid", %{conn: conn, supply_batch: supply_batch} do
      conn = put(conn, Routes.supply_batch_path(conn, :update, supply_batch), supply_batch: @invalid_attrs)
      assert json_response(conn, 422)["errors"] != %{}
    end
  end

  describe "delete supply_batch" do
    setup [:create_supply_batch]

    test "deletes chosen supply_batch", %{conn: conn, supply_batch: supply_batch} do
      conn = delete(conn, Routes.supply_batch_path(conn, :delete, supply_batch))
      assert response(conn, 204)

      assert_error_sent 404, fn ->
        get(conn, Routes.supply_batch_path(conn, :show, supply_batch))
      end
    end
  end

  defp create_supply_batch(_) do
    supply_batch = supply_batch_fixture()
    %{supply_batch: supply_batch}
  end
end
