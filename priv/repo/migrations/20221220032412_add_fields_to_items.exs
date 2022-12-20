defmodule SmexTrack.Repo.Migrations.AddFieldsToItems do
  use Ecto.Migration

  def change do
    alter table(:items) do
      add :amount_unit,       :text
      add :amount_available,  :float
      add :price_per_amount,  :float
    end
  end
end
