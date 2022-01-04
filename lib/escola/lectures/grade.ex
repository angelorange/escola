defmodule Escola.Lectures.Grade do
  use Ecto.Schema
  import Ecto.Changeset

  schema "grades" do
    field :title, :string

    timestamps()
  end

  @doc false
  def changeset(grade, attrs) do
    grade
    |> cast(attrs, [:title])
    |> validate_required([:title])
  end
end
