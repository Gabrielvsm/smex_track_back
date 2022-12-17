defmodule SmexTrack.Production.ProductionItem do
  use Ecto.Schema
  import Ecto.Changeset

  schema "production_items" do
    field :amount, :float
    field :price_by_amount, :float, default: 0.0

    belongs_to :item, SmexTrack.Supply.Item
    belongs_to :production_batch, SmexTrack.Production.ProductionBatch

    timestamps()
  end

  @doc false
  def changeset(production_item, attrs) do
    production_item
    |> cast(attrs, [:amount, :price_by_amount, :item_id, :production_batch_id])
    |> validate_required([:amount, :price_by_amount])
    |> validate_item()
  end

  def validate_item(changeset) do
    try do
      case SmexTrack.Supply.get_item(changeset.changes.item_id) do
        nil -> add_error changeset, :item_id, "Item not found"
        _ -> changeset
      end
    rescue
      KeyError -> changeset
    end
  end
end
