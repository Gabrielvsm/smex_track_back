defmodule SmexTrack.Supply.SupplyBatch do
  use Ecto.Schema
  import Ecto.Changeset

  schema "supply_batches" do
    field :date, :date
    field :total_price, :float, default: 0.0

    has_many :items, SmexTrack.Supply.Item

    timestamps()
  end

  @doc false
  def changeset(supply_batch, attrs) do
    supply_batch
    |> cast(attrs, [:date, :total_price])
    |> validate_required([:date, :total_price])
  end
end
