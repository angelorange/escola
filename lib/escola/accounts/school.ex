defmodule Escola.Accounts.School do
  use Ecto.Schema
  import Ecto.Changeset

  schema "schools" do
    field :address, :string
    field :cnpj, :string
    field :name, :string
    field :partnership, :string

    timestamps()
  end

  @required ~w(name cnpj address partnership)a
  @doc false
  def changeset(school, attrs) do
    school
    |> cast(attrs, @required)
    |> validate_required(@required)
  end
end
