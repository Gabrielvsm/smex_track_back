defmodule SmexTrack.Repo.Migrations.CreateProducts do
  use Ecto.Migration

  def change do
    create table(:products) do
      add :name, :string
      add :price, :float
      add :prod_batch_id, references(:production_batches, on_delete: :delete_all)

      timestamps()
    end

    create index(:products, [:prod_batch_id])
  end
end
