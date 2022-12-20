defmodule SmexTrack.Supply.Item do
  use Ecto.Schema
  import Ecto.Changeset

  schema "items" do
    field :name, :string
    field :price, :float
    field :amount, :float
    field :amount_unit, :string
    field :amount_available, :float
    field :price_per_amount, :float

    belongs_to :supply_batch, SmexTrack.Supply.SupplyBatch
    has_many :production_items, SmexTrack.Production.ProductionItem

    timestamps()
  end

  @doc false
  def changeset(item, attrs) do
    item
    |> cast(attrs, [:name, :price, :amount, :amount_unit])
    |> validate_required([:name, :price, :amount, :amount_unit])
  end
end
