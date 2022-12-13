defmodule SmexTrack.Supply do
  @moduledoc """
  The Supply context.
  """

  import Ecto.Query, warn: false
  alias SmexTrack.Repo

  alias SmexTrack.Supply.SupplyBatch

  @doc """
  Returns the list of supply_batches.

  ## Examples

      iex> list_supply_batches()
      [%SupplyBatch{}, ...]

  """
  def list_supply_batches do
    Repo.all(SupplyBatch) |> Repo.preload(:items)
  end

  @doc """
  Gets a single supply_batch.

  Raises `Ecto.NoResultsError` if the Supply batch does not exist.

  ## Examples

      iex> get_supply_batch!(123)
      %SupplyBatch{}

      iex> get_supply_batch!(456)
      ** (Ecto.NoResultsError)

  """
    def get_supply_batch!(id), do: Repo.get!(SupplyBatch, id) |> Repo.preload(:items)

  @doc """
  Creates a supply_batch.

  ## Examples

      iex> create_supply_batch(%{field: value})
      {:ok, %SupplyBatch{}}

      iex> create_supply_batch(%{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def create_supply_batch(attrs \\ %{}) do
    %SupplyBatch{}
    |> SupplyBatch.changeset(attrs)
    |> Repo.insert()
  end

  @doc """
  Updates a supply_batch.

  ## Examples

      iex> update_supply_batch(supply_batch, %{field: new_value})
      {:ok, %SupplyBatch{}}

      iex> update_supply_batch(supply_batch, %{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def update_supply_batch(%SupplyBatch{} = supply_batch, attrs) do
    supply_batch
    |> SupplyBatch.changeset(attrs)
    |> Repo.update()
  end

  @doc """
  Deletes a supply_batch.

  ## Examples

      iex> delete_supply_batch(supply_batch)
      {:ok, %SupplyBatch{}}

      iex> delete_supply_batch(supply_batch)
      {:error, %Ecto.Changeset{}}

  """
  def delete_supply_batch(%SupplyBatch{} = supply_batch) do
    Repo.delete(supply_batch)
  end

  @doc """
  Returns an `%Ecto.Changeset{}` for tracking supply_batch changes.

  ## Examples

      iex> change_supply_batch(supply_batch)
      %Ecto.Changeset{data: %SupplyBatch{}}

  """
  def change_supply_batch(%SupplyBatch{} = supply_batch, attrs \\ %{}) do
    SupplyBatch.changeset(supply_batch, attrs)
  end

  alias SmexTrack.Supply.Item

  @doc """
  Returns the list of items.

  ## Examples

      iex> list_items()
      [%Item{}, ...]

  """
  def list_items do
    Repo.all(Item)
  end

  @doc """
  Gets a single item.

  Raises `Ecto.NoResultsError` if the Item does not exist.

  ## Examples

      iex> get_item!(123)
      %Item{}

      iex> get_item!(456)
      ** (Ecto.NoResultsError)

  """
  def get_item!(id), do: Repo.get!(Item, id)

  @doc """
  Creates a item and associates it with its supply_batch.

  ## Examples

      iex> create_item(%{field: value}, supply_batch)
      {:ok, %Item{}}

      iex> create_item(%{field: bad_value}, supply_batch)
      {:error, %Ecto.Changeset{}}

  """
  def create_item(attrs \\ %{}, supply_batch) do
    %Item{}
    |> Item.changeset(attrs)
    |> Ecto.Changeset.put_assoc(:supply_batch, supply_batch)
    |> Repo.insert()
  end

  @doc """
  Updates a item.

  ## Examples

      iex> update_item(item, %{field: new_value})
      {:ok, %Item{}}

      iex> update_item(item, %{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def update_item(%Item{} = item, attrs) do
    item
    |> Item.changeset(attrs)
    |> Repo.update()
  end

  @doc """
  Deletes a item.

  ## Examples

      iex> delete_item(item)
      {:ok, %Item{}}

      iex> delete_item(item)
      {:error, %Ecto.Changeset{}}

  """
  def delete_item(%Item{} = item) do
    Repo.delete(item)
  end

  @doc """
  Returns an `%Ecto.Changeset{}` for tracking item changes.

  ## Examples

      iex> change_item(item)
      %Ecto.Changeset{data: %Item{}}

  """
  def change_item(%Item{} = item, attrs \\ %{}) do
    Item.changeset(item, attrs)
  end
end
