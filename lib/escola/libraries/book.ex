defmodule Escola.Libraries.Book do
  use Ecto.Schema
  import Ecto.Changeset

  schema "books" do
    field :description, :string
    field :summary, :string
    field :title, :string

    belongs_to(:discipline, Escola.Lectures.Discipline)

    timestamps()
  end

  @doc false
  def changeset(book, attrs) do
    book
    |> cast(attrs, [:title, :summary, :description, :discipline_id])
    |> validate_required([:title, :summary, :description, :discipline_id])
  end
end
