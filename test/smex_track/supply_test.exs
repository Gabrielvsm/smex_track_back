defmodule SmexTrack.SupplyTest do
  use SmexTrack.DataCase

  alias SmexTrack.Supply

  describe "supply_batches" do
    alias SmexTrack.Supply.SupplyBatch

    import SmexTrack.SupplyFixtures

    @invalid_attrs %{date: nil, total_price: nil}

    test "list_supply_batches/0 returns all supply_batches" do
      supply_batch = supply_batch_fixture()
      assert Supply.list_supply_batches() == [supply_batch]
    end

    test "get_supply_batch!/1 returns the supply_batch with given id" do
      supply_batch = supply_batch_fixture()
      assert Supply.get_supply_batch!(supply_batch.id) == supply_batch
    end

    test "create_supply_batch/1 with valid data creates a supply_batch" do
      valid_attrs = %{date: ~D[2022-12-12], total_price: 120.5}

      assert {:ok, %SupplyBatch{} = supply_batch} = Supply.create_supply_batch(valid_attrs)
      assert supply_batch.date == ~D[2022-12-12]
      assert supply_batch.total_price == 120.5
    end

    test "create_supply_batch/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Supply.create_supply_batch(@invalid_attrs)
    end

    test "update_supply_batch/2 with valid data updates the supply_batch" do
      supply_batch = supply_batch_fixture()
      update_attrs = %{date: ~D[2022-12-13], total_price: 456.7}

      assert {:ok, %SupplyBatch{} = supply_batch} = Supply.update_supply_batch(supply_batch, update_attrs)
      assert supply_batch.date == ~D[2022-12-13]
      assert supply_batch.total_price == 456.7
    end

    test "update_supply_batch/2 with invalid data returns error changeset" do
      supply_batch = supply_batch_fixture()
      assert {:error, %Ecto.Changeset{}} = Supply.update_supply_batch(supply_batch, @invalid_attrs)
      assert supply_batch == Supply.get_supply_batch!(supply_batch.id)
    end

    test "delete_supply_batch/1 deletes the supply_batch" do
      supply_batch = supply_batch_fixture()
      assert {:ok, %SupplyBatch{}} = Supply.delete_supply_batch(supply_batch)
      assert_raise Ecto.NoResultsError, fn -> Supply.get_supply_batch!(supply_batch.id) end
    end

    test "change_supply_batch/1 returns a supply_batch changeset" do
      supply_batch = supply_batch_fixture()
      assert %Ecto.Changeset{} = Supply.change_supply_batch(supply_batch)
    end
  end

  describe "items" do
    alias SmexTrack.Supply.Item

    import SmexTrack.SupplyFixtures

    @invalid_attrs %{amount: nil, name: nil, price: nil}

    test "list_items/0 returns all items" do
      item = item_fixture()
      assert Supply.list_items() == [item]
    end

    test "get_item!/1 returns the item with given id" do
      item = item_fixture()
      assert Supply.get_item!(item.id) == item
    end

    test "create_item/1 with valid data creates a item" do
      valid_attrs = %{amount: 120.5, name: "some name", price: 120.5}

      assert {:ok, %Item{} = item} = Supply.create_item(valid_attrs)
      assert item.amount == 120.5
      assert item.name == "some name"
      assert item.price == 120.5
    end

    test "create_item/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Supply.create_item(@invalid_attrs)
    end

    test "update_item/2 with valid data updates the item" do
      item = item_fixture()
      update_attrs = %{amount: 456.7, name: "some updated name", price: 456.7}

      assert {:ok, %Item{} = item} = Supply.update_item(item, update_attrs)
      assert item.amount == 456.7
      assert item.name == "some updated name"
      assert item.price == 456.7
    end

    test "update_item/2 with invalid data returns error changeset" do
      item = item_fixture()
      assert {:error, %Ecto.Changeset{}} = Supply.update_item(item, @invalid_attrs)
      assert item == Supply.get_item!(item.id)
    end

    test "delete_item/1 deletes the item" do
      item = item_fixture()
      assert {:ok, %Item{}} = Supply.delete_item(item)
      assert_raise Ecto.NoResultsError, fn -> Supply.get_item!(item.id) end
    end

    test "change_item/1 returns a item changeset" do
      item = item_fixture()
      assert %Ecto.Changeset{} = Supply.change_item(item)
    end
  end
end
