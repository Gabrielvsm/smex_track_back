defmodule SmexTrack.Repo.Migrations.CreateSupplyBatches do
  use Ecto.Migration

  def change do
    create table(:supply_batches) do
      add :date, :date
      add :total_price, :float

      timestamps()
    end
  end
end
