defmodule Escola.Repo.Migrations.CreateTaughtGroups do
  use Ecto.Migration

  def change do
    create table(:taught_groups) do
      add :group_id, references(:groups, on_delete: :nothing)
      add :teacher_id, references(:teachers, on_delete: :nothing)
      add :discipline_id, references(:disciplines, on_delete: :nothing)

      timestamps()
    end

    create index(:taught_groups, [:group_id])
    create index(:taught_groups, [:teacher_id])
    create index(:taught_groups, [:discipline_id])
  end
end
