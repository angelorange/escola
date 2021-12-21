defmodule Escola.Profile.Teacher do
  use Ecto.Schema
  import Ecto.Changeset

  schema "teachers" do
    field :title, :string
    field :year, :string

    belongs_to(:school, Escola.Accounts.School)
    belongs_to(:user, Escola.Accounts.User)

    timestamps()
  end

  @required ~w(title year school_id user_id)a
  @doc false
  def changeset(teacher, attrs) do
    teacher
    |> cast(attrs, @required)
    |> validate_required(@required)
    |> unique_constraint(:ra_per_year, name: :teachers_school_id_year_user_id_index)
  end
end
