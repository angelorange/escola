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

  @doc false
  def changeset(school, attrs) do
    school
    |> cast(attrs, [:name, :address, :cnpj, :partnership])
    |> validate_required([:name, :address, :cnpj, :partnership])
  end
end
