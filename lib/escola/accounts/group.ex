defmodule Escola.Accounts.Group do
  use Ecto.Schema
  import Ecto.Changeset

  schema "groups" do
    field :title, :string
    field :year, :string

    belongs_to(:school, Escola.Accounts.School)

    timestamps()
  end

  @required ~w(title year school_id)a
  @doc false
  def changeset(group, attrs) do
    group
    |> cast(attrs, @required)
    |> validate_required(@required)
  end
end
