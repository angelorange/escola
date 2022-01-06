defmodule Escola.Repo.Migrations.CreateBooks do
  use Ecto.Migration

  def change do
    create table(:books) do
      add :title, :string
      add :summary, :string
      add :description, :string

      timestamps()
    end
  end
end
