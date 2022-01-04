defmodule Escola.Lectures do
  @moduledoc """
  The Lectures context.
  """

  import Ecto.Query, warn: false
  alias Escola.Repo

  alias Escola.Lectures.Discipline

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

  alias Escola.Lectures.TaughtGroup

  @doc """
  Returns the list of taught_groups.

  ## Examples

      iex> list_taught_groups()
      [%TaughtGroup{}, ...]

  """
  def list_taught_groups do
    Repo.all(TaughtGroup)
  end

  @doc """
  Gets a single taught_group.

  Raises `Ecto.NoResultsError` if the Taught group does not exist.

  ## Examples

      iex> get_taught_group!(123)
      %TaughtGroup{}

      iex> get_taught_group!(456)
      ** (Ecto.NoResultsError)

  """
  def get_taught_group!(id), do: Repo.get!(TaughtGroup, id)

  @doc """
  Creates a taught_group.

  ## Examples

      iex> create_taught_group(%{field: value})
      {:ok, %TaughtGroup{}}

      iex> create_taught_group(%{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def create_taught_group(attrs \\ %{}) do
    %TaughtGroup{}
    |> TaughtGroup.changeset(attrs)
    |> Repo.insert()
  end

  @doc """
  Updates a taught_group.

  ## Examples

      iex> update_taught_group(taught_group, %{field: new_value})
      {:ok, %TaughtGroup{}}

      iex> update_taught_group(taught_group, %{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def update_taught_group(%TaughtGroup{} = taught_group, attrs) do
    taught_group
    |> TaughtGroup.changeset(attrs)
    |> Repo.update()
  end

  @doc """
  Deletes a taught_group.

  ## Examples

      iex> delete_taught_group(taught_group)
      {:ok, %TaughtGroup{}}

      iex> delete_taught_group(taught_group)
      {:error, %Ecto.Changeset{}}

  """
  def delete_taught_group(%TaughtGroup{} = taught_group) do
    Repo.delete(taught_group)
  end

  @doc """
  Returns an `%Ecto.Changeset{}` for tracking taught_group changes.

  ## Examples

      iex> change_taught_group(taught_group)
      %Ecto.Changeset{data: %TaughtGroup{}}

  """
  def change_taught_group(%TaughtGroup{} = taught_group, attrs \\ %{}) do
    TaughtGroup.changeset(taught_group, attrs)
  end

  alias Escola.Lectures.Grade

  @doc """
  Returns the list of grades.

  ## Examples

      iex> list_grades()
      [%Grade{}, ...]

  """
  def list_grades do
    Repo.all(Grade)
  end

  @doc """
  Gets a single grade.

  Raises `Ecto.NoResultsError` if the Grade does not exist.

  ## Examples

      iex> get_grade!(123)
      %Grade{}

      iex> get_grade!(456)
      ** (Ecto.NoResultsError)

  """
  def get_grade!(id), do: Repo.get!(Grade, id)

  @doc """
  Creates a grade.

  ## Examples

      iex> create_grade(%{field: value})
      {:ok, %Grade{}}

      iex> create_grade(%{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def create_grade(attrs \\ %{}) do
    %Grade{}
    |> Grade.changeset(attrs)
    |> Repo.insert()
  end

  @doc """
  Updates a grade.

  ## Examples

      iex> update_grade(grade, %{field: new_value})
      {:ok, %Grade{}}

      iex> update_grade(grade, %{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def update_grade(%Grade{} = grade, attrs) do
    grade
    |> Grade.changeset(attrs)
    |> Repo.update()
  end

  @doc """
  Deletes a grade.

  ## Examples

      iex> delete_grade(grade)
      {:ok, %Grade{}}

      iex> delete_grade(grade)
      {:error, %Ecto.Changeset{}}

  """
  def delete_grade(%Grade{} = grade) do
    Repo.delete(grade)
  end

  @doc """
  Returns an `%Ecto.Changeset{}` for tracking grade changes.

  ## Examples

      iex> change_grade(grade)
      %Ecto.Changeset{data: %Grade{}}

  """
  def change_grade(%Grade{} = grade, attrs \\ %{}) do
    Grade.changeset(grade, attrs)
  end
end
