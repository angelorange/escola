defmodule Escola.Repo.Migrations.AddTitleToStudents do
  use Ecto.Migration

  def change do
    alter table(:students) do
      add :title, :string
    end
  end
end
