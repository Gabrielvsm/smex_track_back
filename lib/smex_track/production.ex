defmodule SmexTrack.Production do
  @moduledoc """
  The Production context.
  """

  import Ecto.Query, warn: false
  alias SmexTrack.Repo

  alias SmexTrack.Production.ProductionBatch
  alias SmexTrack.Supply

  @doc """
  Returns the list of production_batches.

  ## Examples

      iex> list_production_batches()
      [%ProductionBatch{}, ...]

  """
  def list_production_batches do
    Repo.all(ProductionBatch)
  end

  @doc """
  Gets a single production_batch.

  Raises `Ecto.NoResultsError` if the Production batch does not exist.

  ## Examples

      iex> get_production_batch!(123)
      %ProductionBatch{}

      iex> get_production_batch!(456)
      ** (Ecto.NoResultsError)

  """
  def get_production_batch!(id), do: Repo.get!(ProductionBatch, id)

  @doc """
  Creates a production_batch.

  ## Examples

      iex> create_production_batch(%{field: value})
      {:ok, %ProductionBatch{}}

      iex> create_production_batch(%{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def create_production_batch(attrs \\ %{}) do
    %ProductionBatch{}
    |> ProductionBatch.changeset(attrs)
    |> Repo.insert()
  end

  @doc """
  Updates a production_batch.

  ## Examples

      iex> update_production_batch(production_batch, %{field: new_value})
      {:ok, %ProductionBatch{}}

      iex> update_production_batch(production_batch, %{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def update_production_batch(%ProductionBatch{} = production_batch, attrs) do
    production_batch
    |> ProductionBatch.changeset(attrs)
    |> Repo.update()
  end

  @doc """
  Deletes a production_batch.

  ## Examples

      iex> delete_production_batch(production_batch)
      {:ok, %ProductionBatch{}}

      iex> delete_production_batch(production_batch)
      {:error, %Ecto.Changeset{}}

  """
  def delete_production_batch(%ProductionBatch{} = production_batch) do
    Repo.delete(production_batch)
  end

  @doc """
  Returns an `%Ecto.Changeset{}` for tracking production_batch changes.

  ## Examples

      iex> change_production_batch(production_batch)
      %Ecto.Changeset{data: %ProductionBatch{}}

  """
  def change_production_batch(%ProductionBatch{} = production_batch, attrs \\ %{}) do
    ProductionBatch.changeset(production_batch, attrs)
  end

  alias SmexTrack.Production.ProductionItem

  @doc """
  Returns the list of production_items.

  ## Examples

      iex> list_production_items()
      [%ProductionItem{}, ...]

  """
  def list_production_items do
    Repo.all(ProductionItem)
  end

  @doc """
  Gets a single production_item.

  Raises `Ecto.NoResultsError` if the Production item does not exist.

  ## Examples

      iex> get_production_item!(123)
      %ProductionItem{}

      iex> get_production_item!(456)
      ** (Ecto.NoResultsError)

  """
  def get_production_item!(id), do: Repo.get!(ProductionItem, id)

  @doc """
  Creates a production_item.

  ## Examples

      iex> create_production_item(%{field: value}, production_batch)
      {:ok, %ProductionItem{}}

      iex> create_production_item(%{field: bad_value}, production_batch)
      {:error, %Ecto.Changeset{}}

  """
  def create_production_item(attrs \\ %{}, production_batch) do
    item = Supply.get_item!(attrs["item_id"])

    %ProductionItem{}
    |> ProductionItem.changeset(attrs)
    |> Ecto.Changeset.put_assoc(:production_batch, production_batch)
    |> Ecto.Changeset.put_assoc(:item, item)
    |> calculate_price_by_amount(item)
    |> Repo.insert()
  end

  defp calculate_price_by_amount(changeset, item) do
    item_price = item.price
    item_amount = item.amount
    amount = changeset.changes.amount
    percent_index = amount / item_amount

    Ecto.Changeset.change changeset, %{price_by_amount: item_price * percent_index}
  end

  @doc """
  Updates a production_item.

  ## Examples

      iex> update_production_item(production_item, %{field: new_value})
      {:ok, %ProductionItem{}}

      iex> update_production_item(production_item, %{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def update_production_item(%ProductionItem{} = production_item, attrs) do
    production_item
    |> ProductionItem.changeset(attrs)
    |> Repo.update()
  end

  @doc """
  Deletes a production_item.

  ## Examples

      iex> delete_production_item(production_item)
      {:ok, %ProductionItem{}}

      iex> delete_production_item(production_item)
      {:error, %Ecto.Changeset{}}

  """
  def delete_production_item(%ProductionItem{} = production_item) do
    Repo.delete(production_item)
  end

  @doc """
  Returns an `%Ecto.Changeset{}` for tracking production_item changes.

  ## Examples

      iex> change_production_item(production_item)
      %Ecto.Changeset{data: %ProductionItem{}}

  """
  def change_production_item(%ProductionItem{} = production_item, attrs \\ %{}) do
    ProductionItem.changeset(production_item, attrs)
  end

  alias SmexTrack.Production.Product

  @doc """
  Returns the list of products.

  ## Examples

      iex> list_products()
      [%Product{}, ...]

  """
  def list_products do
    Repo.all(Product)
  end

  @doc """
  Gets a single product.

  Raises `Ecto.NoResultsError` if the Product does not exist.

  ## Examples

      iex> get_product!(123)
      %Product{}

      iex> get_product!(456)
      ** (Ecto.NoResultsError)

  """
  def get_product!(id), do: Repo.get!(Product, id)

  @doc """
  Creates a product.

  ## Examples

      iex> create_product(%{field: value})
      {:ok, %Product{}}

      iex> create_product(%{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def create_product(attrs \\ %{}) do
    %Product{}
    |> Product.changeset(attrs)
    |> Repo.insert()
  end

  @doc """
  Updates a product.

  ## Examples

      iex> update_product(product, %{field: new_value})
      {:ok, %Product{}}

      iex> update_product(product, %{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def update_product(%Product{} = product, attrs) do
    product
    |> Product.changeset(attrs)
    |> Repo.update()
  end

  @doc """
  Deletes a product.

  ## Examples

      iex> delete_product(product)
      {:ok, %Product{}}

      iex> delete_product(product)
      {:error, %Ecto.Changeset{}}

  """
  def delete_product(%Product{} = product) do
    Repo.delete(product)
  end

  @doc """
  Returns an `%Ecto.Changeset{}` for tracking product changes.

  ## Examples

      iex> change_product(product)
      %Ecto.Changeset{data: %Product{}}

  """
  def change_product(%Product{} = product, attrs \\ %{}) do
    Product.changeset(product, attrs)
  end
end
