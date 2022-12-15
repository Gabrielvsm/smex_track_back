defmodule SmexTrack.Production.ProductionItem do
  use Ecto.Schema
  import Ecto.Changeset

  schema "production_items" do
    field :amount, :float
    field :price_by_amount, :float
    field :item_id, :id
    field :production_batch_id, :id

    belongs_to :items, SmexTrack.Supply.Item
    belongs_to :production_batches, SmexTrack.Production.ProductionBatch

    timestamps()
  end

  @doc false
  def changeset(production_item, attrs) do
    production_item
    |> cast(attrs, [:amount, :price_by_amount])
    |> validate_required([:amount, :price_by_amount])
  end
end
