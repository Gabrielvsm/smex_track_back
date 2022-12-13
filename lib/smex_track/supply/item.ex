defmodule SmexTrack.Supply.Item do
  use Ecto.Schema
  import Ecto.Changeset

  schema "items" do
    field :amount, :float
    field :name, :string
    field :price, :float

    belongs_to :supply_batch, SmexTrack.Supply.SupplyBatch

    timestamps()
  end

  @doc false
  def changeset(item, attrs) do
    item
    |> cast(attrs, [:name, :price, :amount])
    |> validate_required([:name, :price, :amount])
  end
end
