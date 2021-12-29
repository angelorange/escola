defmodule Escola.Trait.Discipline do
  use Ecto.Schema
  import Ecto.Changeset

  schema "disciplines" do
    field :title, :string

    timestamps()
  end

  @doc false
  def changeset(discipline, attrs) do
    discipline
    |> cast(attrs, [:title])
    |> validate_required([:title])
  end
end
