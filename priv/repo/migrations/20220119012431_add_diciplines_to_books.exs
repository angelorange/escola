defmodule Escola.Repo.Migrations.AddDisciplinesToBooks do
  use Ecto.Migration

  def change do
    alter table(:books) do
     add :discipline_id, references(:disciplines)

    end

    create index(:books, [:discipline_id])
  end
end
