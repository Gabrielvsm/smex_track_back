defmodule SmexTrack.Repo.Migrations.AlterProductRelations do
  use Ecto.Migration

  def change do
    create index(:products, [:production_batch_id, :id])
  end
end
