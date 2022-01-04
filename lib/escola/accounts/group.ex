defmodule Escola.Accounts.Group do
  use Ecto.Schema
  import Ecto.Changeset

  schema "groups" do
    field :title, :string
    field :year, :string

    belongs_to(:school, Escola.Accounts.School)

    many_to_many :students, Escola.Profile.Student,
    join_through: "students_groups",
    on_replace: :delete

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
