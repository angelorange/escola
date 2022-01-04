defmodule Escola.Profile.Student do
  use Ecto.Schema
  import Ecto.Changeset

  schema "students" do
    field :ra, :string
    field :year, :string
    field :title, :string

    belongs_to(:school, Escola.Accounts.School)
    belongs_to(:user, Escola.Accounts.User)

    many_to_many :groups, Escola.Accounts.Group,
    join_through: "students_groups",
    on_replace: :delete

    timestamps()
  end

  @required ~w(ra year school_id user_id title)a
  @doc false
  def changeset(student, attrs) do
    student
    |> cast(attrs, @required)
    |> validate_required(@required)
    |> unique_constraint(:ra_per_year, name: :students_ra_school_id_year_index)
  end
end
