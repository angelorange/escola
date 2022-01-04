defmodule Escola.Accounts.TaughtGroup do
  use Ecto.Schema
  import Ecto.Changeset

  schema "taught_groups" do
    field :group_id, :id
    field :teacher_id, :id
    field :discipline_id, :id

    timestamps()
  end

  @required ~w(group_id teacher_id discipline_id)a
  @doc false
  def changeset(taught_group, attrs) do
    taught_group
    |> cast(attrs, @required)
    |> validate_required(@required)
  end
end
