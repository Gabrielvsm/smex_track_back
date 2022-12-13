defmodule SmexTrack.Repo.Migrations.CreateProductionBatches do
  use Ecto.Migration

  def change do
    create table(:production_batches) do
      add :date, :date
      add :total_cost, :float

      timestamps()
    end
  end
end
