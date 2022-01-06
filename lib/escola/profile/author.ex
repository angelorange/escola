defmodule Escola.Profile.Author do
  use Ecto.Schema
  import Ecto.Changeset

  schema "authors" do
    field :title, :string

    belongs_to(:user, Escola.Accounts.User)

    timestamps()
  end

  @required ~w(user_id title)a
  @doc false
  def changeset(author, attrs) do
    author
    |> cast(attrs, @required)
    |> validate_required(@required)
  end
end
