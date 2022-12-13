defmodule SmexTrack.ProductionTest do
  use SmexTrack.DataCase

  alias SmexTrack.Production

  describe "production_batches" do
    alias SmexTrack.Production.ProductionBatch

    import SmexTrack.ProductionFixtures

    @invalid_attrs %{date: nil, total_cost: nil}

    test "list_production_batches/0 returns all production_batches" do
      production_batch = production_batch_fixture()
      assert Production.list_production_batches() == [production_batch]
    end

    test "get_production_batch!/1 returns the production_batch with given id" do
      production_batch = production_batch_fixture()
      assert Production.get_production_batch!(production_batch.id) == production_batch
    end

    test "create_production_batch/1 with valid data creates a production_batch" do
      valid_attrs = %{date: ~D[2022-12-12], total_cost: 120.5}

      assert {:ok, %ProductionBatch{} = production_batch} = Production.create_production_batch(valid_attrs)
      assert production_batch.date == ~D[2022-12-12]
      assert production_batch.total_cost == 120.5
    end

    test "create_production_batch/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Production.create_production_batch(@invalid_attrs)
    end

    test "update_production_batch/2 with valid data updates the production_batch" do
      production_batch = production_batch_fixture()
      update_attrs = %{date: ~D[2022-12-13], total_cost: 456.7}

      assert {:ok, %ProductionBatch{} = production_batch} = Production.update_production_batch(production_batch, update_attrs)
      assert production_batch.date == ~D[2022-12-13]
      assert production_batch.total_cost == 456.7
    end

    test "update_production_batch/2 with invalid data returns error changeset" do
      production_batch = production_batch_fixture()
      assert {:error, %Ecto.Changeset{}} = Production.update_production_batch(production_batch, @invalid_attrs)
      assert production_batch == Production.get_production_batch!(production_batch.id)
    end

    test "delete_production_batch/1 deletes the production_batch" do
      production_batch = production_batch_fixture()
      assert {:ok, %ProductionBatch{}} = Production.delete_production_batch(production_batch)
      assert_raise Ecto.NoResultsError, fn -> Production.get_production_batch!(production_batch.id) end
    end

    test "change_production_batch/1 returns a production_batch changeset" do
      production_batch = production_batch_fixture()
      assert %Ecto.Changeset{} = Production.change_production_batch(production_batch)
    end
  end

  describe "production_items" do
    alias SmexTrack.Production.ProductionItem

    import SmexTrack.ProductionFixtures

    @invalid_attrs %{amount: nil, price_by_amount: nil}

    test "list_production_items/0 returns all production_items" do
      production_item = production_item_fixture()
      assert Production.list_production_items() == [production_item]
    end

    test "get_production_item!/1 returns the production_item with given id" do
      production_item = production_item_fixture()
      assert Production.get_production_item!(production_item.id) == production_item
    end

    test "create_production_item/1 with valid data creates a production_item" do
      valid_attrs = %{amount: 120.5, price_by_amount: 120.5}

      assert {:ok, %ProductionItem{} = production_item} = Production.create_production_item(valid_attrs)
      assert production_item.amount == 120.5
      assert production_item.price_by_amount == 120.5
    end

    test "create_production_item/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Production.create_production_item(@invalid_attrs)
    end

    test "update_production_item/2 with valid data updates the production_item" do
      production_item = production_item_fixture()
      update_attrs = %{amount: 456.7, price_by_amount: 456.7}

      assert {:ok, %ProductionItem{} = production_item} = Production.update_production_item(production_item, update_attrs)
      assert production_item.amount == 456.7
      assert production_item.price_by_amount == 456.7
    end

    test "update_production_item/2 with invalid data returns error changeset" do
      production_item = production_item_fixture()
      assert {:error, %Ecto.Changeset{}} = Production.update_production_item(production_item, @invalid_attrs)
      assert production_item == Production.get_production_item!(production_item.id)
    end

    test "delete_production_item/1 deletes the production_item" do
      production_item = production_item_fixture()
      assert {:ok, %ProductionItem{}} = Production.delete_production_item(production_item)
      assert_raise Ecto.NoResultsError, fn -> Production.get_production_item!(production_item.id) end
    end

    test "change_production_item/1 returns a production_item changeset" do
      production_item = production_item_fixture()
      assert %Ecto.Changeset{} = Production.change_production_item(production_item)
    end
  end

  describe "products" do
    alias SmexTrack.Production.Product

    import SmexTrack.ProductionFixtures

    @invalid_attrs %{name: nil, price: nil}

    test "list_products/0 returns all products" do
      product = product_fixture()
      assert Production.list_products() == [product]
    end

    test "get_product!/1 returns the product with given id" do
      product = product_fixture()
      assert Production.get_product!(product.id) == product
    end

    test "create_product/1 with valid data creates a product" do
      valid_attrs = %{name: "some name", price: 120.5}

      assert {:ok, %Product{} = product} = Production.create_product(valid_attrs)
      assert product.name == "some name"
      assert product.price == 120.5
    end

    test "create_product/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Production.create_product(@invalid_attrs)
    end

    test "update_product/2 with valid data updates the product" do
      product = product_fixture()
      update_attrs = %{name: "some updated name", price: 456.7}

      assert {:ok, %Product{} = product} = Production.update_product(product, update_attrs)
      assert product.name == "some updated name"
      assert product.price == 456.7
    end

    test "update_product/2 with invalid data returns error changeset" do
      product = product_fixture()
      assert {:error, %Ecto.Changeset{}} = Production.update_product(product, @invalid_attrs)
      assert product == Production.get_product!(product.id)
    end

    test "delete_product/1 deletes the product" do
      product = product_fixture()
      assert {:ok, %Product{}} = Production.delete_product(product)
      assert_raise Ecto.NoResultsError, fn -> Production.get_product!(product.id) end
    end

    test "change_product/1 returns a product changeset" do
      product = product_fixture()
      assert %Ecto.Changeset{} = Production.change_product(product)
    end
  end
end
