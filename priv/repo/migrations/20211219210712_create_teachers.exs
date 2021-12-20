defmodule Escola.Repo.Migrations.CreateTeachers do
  use Ecto.Migration

  def change do
    create table(:teachers) do
      add :year, :string
      add :title, :string
      add :school_id, references(:schools, on_delete: :nothing)
      add :user_id, references(:users, on_delete: :nothing)

      timestamps()
    end

    create index(:teachers, [:school_id])
    create index(:teachers, [:user_id])
  end
end
