defmodule SmexTrack.Production.ProductionItem do
  use Ecto.Schema
  import Ecto.Changeset

  schema "production_items" do
    field :amount, :float
    field :price_by_amount, :float, default: 0.0

    belongs_to :item, SmexTrack.Supply.Item
    belongs_to :product, SmexTrack.Production.Product

    timestamps()
  end

  @doc false
  def changeset(production_item, attrs) do
    production_item
    |> cast(attrs, [:amount, :item_id])
    |> validate_required([:amount, :item_id])
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
