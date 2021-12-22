defmodule Escola.Profile.Support do
  use Ecto.Schema
  import Ecto.Changeset

  schema "supports" do
    field :title, :string

    belongs_to(:user, Escola.Accounts.User)

    timestamps()
  end

  @required ~w(title user_id)a
  @doc false
  def changeset(support, attrs) do
    support
    |> cast(attrs, @required)
    |> validate_required(@required)
  end
end
