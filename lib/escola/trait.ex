defmodule Escola.Trait do
  @moduledoc """
  The Trait context.
  """

  import Ecto.Query, warn: false
  alias Escola.Repo

  alias Escola.Trait.Discipline

  @doc """
  Returns the list of disciplines.

  ## Examples

      iex> list_disciplines()
      [%Discipline{}, ...]

  """
  def list_disciplines do
    Repo.all(Discipline)
  end

  @doc """
  Gets a single discipline.

  Raises `Ecto.NoResultsError` if the Discipline does not exist.

  ## Examples

      iex> get_discipline!(123)
      %Discipline{}

      iex> get_discipline!(456)
      ** (Ecto.NoResultsError)

  """
  def get_discipline!(id), do: Repo.get!(Discipline, id)

  @doc """
  Creates a discipline.

  ## Examples

      iex> create_discipline(%{field: value})
      {:ok, %Discipline{}}

      iex> create_discipline(%{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def create_discipline(attrs \\ %{}) do
    %Discipline{}
    |> Discipline.changeset(attrs)
    |> Repo.insert()
  end

  @doc """
  Updates a discipline.

  ## Examples

      iex> update_discipline(discipline, %{field: new_value})
      {:ok, %Discipline{}}

      iex> update_discipline(discipline, %{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def update_discipline(%Discipline{} = discipline, attrs) do
    discipline
    |> Discipline.changeset(attrs)
    |> Repo.update()
  end

  @doc """
  Deletes a discipline.

  ## Examples

      iex> delete_discipline(discipline)
      {:ok, %Discipline{}}

      iex> delete_discipline(discipline)
      {:error, %Ecto.Changeset{}}

  """
  def delete_discipline(%Discipline{} = discipline) do
    Repo.delete(discipline)
  end

  @doc """
  Returns an `%Ecto.Changeset{}` for tracking discipline changes.

  ## Examples

      iex> change_discipline(discipline)
      %Ecto.Changeset{data: %Discipline{}}

  """
  def change_discipline(%Discipline{} = discipline, attrs \\ %{}) do
    Discipline.changeset(discipline, attrs)
  end
end
