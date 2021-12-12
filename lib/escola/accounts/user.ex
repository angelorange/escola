defmodule Escola.Accounts.User do
  use Ecto.Schema
  import Ecto.Changeset

  schema "users" do
    field :email, :string
    field :name, :string
    field :password, :string

    timestamps()
  end

  @required ~w(name password email)a
  @doc false
  def changeset(user, attrs) do
    user
    |> cast(attrs, @required)
    |> validate_required(@required)
    |> validate_length(:password, min: 6)
    |> normalize(attrs)
    |> unique_constraint(:email)
    |> put_password()
  end

  defp put_password(%Ecto.Changeset{valid?: true, changes: %{password: password}} = changeset) do
    change(changeset, password: Bcrypt.hash_pwd_salt(password))
  end

  defp put_password(changeset), do: changeset

  defp normalize(%Ecto.Changeset{valid?: true, changes: %{email: _}} = changeset, %{email: email}) do
    new_email =
      email
      |> String.trim()
      |> String.downcase()

    change(changeset, email: new_email)
  end

  defp normalize(changeset, _), do: changeset
end
