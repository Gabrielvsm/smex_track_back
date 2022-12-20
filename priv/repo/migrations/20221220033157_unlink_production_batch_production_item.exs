defmodule SmexTrack.Repo.Migrations.UnlinkProductionBatchProductionItem do
  use Ecto.Migration

  def change do
    drop index(:production_items, [:item_id, :production_batch_id])
    drop index(:production_items, [:production_id])

    alter table(:production_items) do
      remove :production_batch_id
    end
  end
end
