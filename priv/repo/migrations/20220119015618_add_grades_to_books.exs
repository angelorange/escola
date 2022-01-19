defmodule Escola.Repo.Migrations.AddGradesToBooks do
  use Ecto.Migration

  def change do
    alter table(:books) do
     add :grade_id, references(:grades)

    end

    create index(:books, [:grade_id])
  end
end
