defmodule Escola.Repo.Migrations.CreateStudents do
  use Ecto.Migration

  def change do
    create table(:students) do
      add :year, :string
      add :ra, :string
      add :school_id, references(:schools, on_delete: :nothing)
      add :user_id, references(:users, on_delete: :nothing)

      timestamps()
    end

    create index(:students, [:school_id])
    create index(:students, [:user_id])

    create unique_index(:students, [:ra, :school_id, :year], name: :student_per_year_index)

  end
end
