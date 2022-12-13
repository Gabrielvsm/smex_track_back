defmodule SmexTrack.Repo.Migrations.CreateItems do
  use Ecto.Migration

  def change do
    create table(:items) do
      add :name, :string
      add :price, :float
      add :amount, :float
      add :supply_batch_id, references(:supply_batches, on_delete: :delete_all)

      timestamps()
    end

    create index(:items, [:supply_batch_id])
    create index(:items, [:supply_batch_id, :id])
  end
end
