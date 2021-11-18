defmodule Escola.Repo.Migrations.CreateSchools do
  use Ecto.Migration

  def change do
    create table(:schools) do
      add :name, :string
      add :address, :string
      add :cnpj, :string
      add :partnership, :string

      timestamps()
    end
  end
end
