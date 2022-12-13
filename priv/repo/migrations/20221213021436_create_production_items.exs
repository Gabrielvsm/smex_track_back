defmodule SmexTrack.Repo.Migrations.CreateProductionItems do
  use Ecto.Migration

  def change do
    create table(:production_items) do
      add :amount, :float
      add :price_by_amount, :float
      add :item_id, references(:items, on_delete: :delete_all)
      add :production_id, references(:production_batches, on_delete: :delete_all)

      timestamps()
    end

    create index(:production_items, [:item_id])
    create index(:production_items, [:production_id])
    create index(:production_items, [:item_id, :production_id])
  end
end
