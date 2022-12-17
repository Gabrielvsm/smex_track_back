defmodule SmexTrack.Repo.Migrations.AddProductionBatchProductionItemRelation do
  use Ecto.Migration

  def change do
    drop index(:production_items, [:item_id, :production_id])

    rename table(:production_items), :production_id, to: :production_batch_id
    create index(:production_items, [:item_id, :production_batch_id])
  end
end
