defmodule SmexTrack.Production.Product do
  use Ecto.Schema
  import Ecto.Changeset

  schema "products" do
    field :name,                 :string
    field :cost,                 :float
    field :price,                :float

    belongs_to :production_batch, SmexTrack.Production.ProductionBatch
    has_many :production_items, SmexTrack.Production.ProductionItem

    timestamps()
  end

  @doc false
  def changeset(product, attrs) do
    product
    |> cast(attrs, [:name])
    |> validate_required([:name])
  end
end
