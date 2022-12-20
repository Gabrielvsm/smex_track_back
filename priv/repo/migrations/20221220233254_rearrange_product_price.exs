defmodule SmexTrack.Repo.Migrations.RearrangeProductPrice do
  use Ecto.Migration

  def change do
    alter table(:products) do
      add :cost, :float
    end
  end
end
