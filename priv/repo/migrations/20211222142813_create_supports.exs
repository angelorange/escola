defmodule Escola.Repo.Migrations.CreateSupports do
  use Ecto.Migration

  def change do
    create table(:supports) do
      add :title, :string
      add :user_id, references(:users, on_delete: :nothing)

      timestamps()
    end

    create index(:supports, [:user_id])
  end
end
