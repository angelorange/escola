defmodule Escola.Lectures.TaughtGroup do
  use Ecto.Schema
  import Ecto.Changeset

  schema "taught_groups" do
    belongs_to(:teacher, Escola.Profile.Teacher)
    belongs_to(:group, Escola.Accounts.Group)
    belongs_to(:discipline, Escola.Lectures.Discipline)

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
