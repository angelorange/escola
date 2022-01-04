defmodule Escola.Repo.Migrations.CreateGrades do
  use Ecto.Migration

  def change do
    create table(:grades) do
      add :title, :string

      timestamps()
    end
  end
end
