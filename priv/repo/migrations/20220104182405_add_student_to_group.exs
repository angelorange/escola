defmodule Escola.Repo.Migrations.AddStudentToGroup do
  use Ecto.Migration

  def change do
    create table(:students_groups, primary_key: false) do
      add :student_id, references(:students, on_delete: :delete_all), primary_key: true
      add :group_id, references(:groups, on_delete: :delete_all), primary_key: true
    end

    create index(:students_groups, [:student_id])
    create index(:students_groups, [:group_id])

    create(unique_index(:students_groups, [:student_id, :group_id], name: :student_id_group_id_unique_index))
  end
end
