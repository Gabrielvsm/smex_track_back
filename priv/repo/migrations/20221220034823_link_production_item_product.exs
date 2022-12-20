defmodule SmexTrack.Repo.Migrations.LinkProductionItemProduct do
  use Ecto.Migration

  def change do
    create index(:production_items, [:product_id])
    create index(:production_items, [:product_id, :id])
  end
end
