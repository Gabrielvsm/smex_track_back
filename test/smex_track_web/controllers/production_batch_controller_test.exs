defmodule SmexTrackWeb.ProductionBatchControllerTest do
  use SmexTrackWeb.ConnCase

  import SmexTrack.ProductionFixtures

  alias SmexTrack.Production.ProductionBatch

  @create_attrs %{

  }
  @update_attrs %{

  }
  @invalid_attrs %{}

  setup %{conn: conn} do
    {:ok, conn: put_req_header(conn, "accept", "application/json")}
  end

  describe "index" do
    test "lists all production_batches", %{conn: conn} do
      conn = get(conn, Routes.production_batch_path(conn, :index))
      assert json_response(conn, 200)["data"] == []
    end
  end

  describe "create production_batch" do
    test "renders production_batch when data is valid", %{conn: conn} do
      conn = post(conn, Routes.production_batch_path(conn, :create), production_batch: @create_attrs)
      assert %{"id" => id} = json_response(conn, 201)["data"]

      conn = get(conn, Routes.production_batch_path(conn, :show, id))

      assert %{
               "id" => ^id
             } = json_response(conn, 200)["data"]
    end

    test "renders errors when data is invalid", %{conn: conn} do
      conn = post(conn, Routes.production_batch_path(conn, :create), production_batch: @invalid_attrs)
      assert json_response(conn, 422)["errors"] != %{}
    end
  end

  describe "update production_batch" do
    setup [:create_production_batch]

    test "renders production_batch when data is valid", %{conn: conn, production_batch: %ProductionBatch{id: id} = production_batch} do
      conn = put(conn, Routes.production_batch_path(conn, :update, production_batch), production_batch: @update_attrs)
      assert %{"id" => ^id} = json_response(conn, 200)["data"]

      conn = get(conn, Routes.production_batch_path(conn, :show, id))

      assert %{
               "id" => ^id
             } = json_response(conn, 200)["data"]
    end

    test "renders errors when data is invalid", %{conn: conn, production_batch: production_batch} do
      conn = put(conn, Routes.production_batch_path(conn, :update, production_batch), production_batch: @invalid_attrs)
      assert json_response(conn, 422)["errors"] != %{}
    end
  end

  describe "delete production_batch" do
    setup [:create_production_batch]

    test "deletes chosen production_batch", %{conn: conn, production_batch: production_batch} do
      conn = delete(conn, Routes.production_batch_path(conn, :delete, production_batch))
      assert response(conn, 204)

      assert_error_sent 404, fn ->
        get(conn, Routes.production_batch_path(conn, :show, production_batch))
      end
    end
  end

  defp create_production_batch(_) do
    production_batch = production_batch_fixture()
    %{production_batch: production_batch}
  end
end
