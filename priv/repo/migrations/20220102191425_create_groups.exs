defmodule Escola.Repo.Migrations.CreateGroups do
  use Ecto.Migration

  def change do
    create table(:groups) do
      add :title, :string
      add :year, :string
      add :school_id, references(:schools, on_delete: :nothing)

      timestamps()
    end

    create index(:groups, [:school_id])
  end
end
