defmodule AccountCore.Repo.Migrations.AddPubgIdToUsers do
  use Ecto.Migration

  def change do
    alter table(:users) do
      add :pubg_id, :string
    end
  end
end
