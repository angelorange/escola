defmodule Escola.Repo.Migrations.CreateDisciplines do
  use Ecto.Migration

  def change do
    create table(:disciplines) do
      add :title, :string

      timestamps()
    end
  end
end
