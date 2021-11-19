defmodule EscolaWeb.Validators.User.Create do
  @moduledoc false

  use Ecto.Schema

  import Ecto.Changeset

  @behaviour EscolaWeb.Validator

  @primary_key false
  embedded_schema do
    field :name, :string
    field :email, :string
    field :password, :string
  end

  @required ~w(name email password)a

  @impl true
  def changeset(params) do
    %__MODULE__{}
    |> cast(params, @required)
  end
end
