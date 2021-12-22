defmodule Escola.Profile do
  @moduledoc """
  The Profile context.
  """

  import Ecto.Query, warn: false
  alias Escola.Repo

  @doc """
  Returns a profile struct based on a profile title and id if exists.
  """
  @spec get_profile(String.t(), String.t() | Integer.t()) :: {:ok, term()} | {:error, :not_found}
  def get_profile(profile, profile_id) do
    case profile do
      "student" -> get_student(profile_id)
      _ -> {:error, :not_found}
    end
  end

  alias Escola.Profile.Student

  @doc """
  Returns the list of students.

  ## Examples

      iex> list_students()
      [%Student{}, ...]

  """
  def list_students do
    Repo.all(Student)
  end

  def list_by_user(id) do
    Student
    |> where([s], s.user_id == ^id)
    |> Repo.all()
  end

  @doc """
  Gets a single student.

  Raises `Ecto.NoResultsError` if the Student does not exist.

  ## Examples

      iex> get_student!(123)
      %Student{}

      iex> get_student!(456)
      ** (Ecto.NoResultsError)

  """
  def get_student!(id), do: Repo.get!(Student, id)

  @doc """
  Creates a student.

  ## Examples

      iex> create_student(%{field: value})
      {:ok, %Student{}}

      iex> create_student(%{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def create_student(attrs \\ %{}) do
    %Student{}
    |> Student.changeset(attrs)
    |> Repo.insert()
  end

  @doc """
  Updates a student.

  ## Examples

      iex> update_student(student, %{field: new_value})
      {:ok, %Student{}}

      iex> update_student(student, %{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def update_student(%Student{} = student, attrs) do
    student
    |> Student.changeset(attrs)
    |> Repo.update()
  end

  @doc """
  Deletes a student.

  ## Examples

      iex> delete_student(student)
      {:ok, %Student{}}

      iex> delete_student(student)
      {:error, %Ecto.Changeset{}}

  """
  def delete_student(%Student{} = student) do
    Repo.delete(student)
  end

  @doc """
  Returns an `%Ecto.Changeset{}` for tracking student changes.

  ## Examples

      iex> change_student(student)
      %Ecto.Changeset{data: %Student{}}

  """
  def change_student(%Student{} = student, attrs \\ %{}) do
    Student.changeset(student, attrs)
  end

  @doc """
  Returns a single student.
  """
  @spec get_student(Integer.t() | String.t()) :: {:error, :not_found} | {:ok, Student.t()}
  def get_student(id) do
    case Repo.get(Student, id) do
      nil -> {:error, :not_found}
      student -> {:ok, student}
    end
  end

  alias Escola.Profile.Teacher

  @doc """
  Returns the list of teachers.

  ## Examples

      iex> list_teachers()
      [%Teacher{}, ...]

  """
  def list_teachers do
    Repo.all(Teacher)
  end

  @doc """
  Gets a single teacher.

  Raises `Ecto.NoResultsError` if the Teacher does not exist.

  ## Examples

      iex> get_teacher!(123)
      %Teacher{}

      iex> get_teacher!(456)
      ** (Ecto.NoResultsError)

  """
  def get_teacher!(id), do: Repo.get!(Teacher, id)

  @doc """
  Creates a teacher.

  ## Examples

      iex> create_teacher(%{field: value})
      {:ok, %Teacher{}}

      iex> create_teacher(%{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def create_teacher(attrs \\ %{}) do
    %Teacher{}
    |> Teacher.changeset(attrs)
    |> Repo.insert()
  end

  @doc """
  Updates a teacher.

  ## Examples

      iex> update_teacher(teacher, %{field: new_value})
      {:ok, %Teacher{}}

      iex> update_teacher(teacher, %{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def update_teacher(%Teacher{} = teacher, attrs) do
    teacher
    |> Teacher.changeset(attrs)
    |> Repo.update()
  end

  @doc """
  Deletes a teacher.

  ## Examples

      iex> delete_teacher(teacher)
      {:ok, %Teacher{}}

      iex> delete_teacher(teacher)
      {:error, %Ecto.Changeset{}}

  """
  def delete_teacher(%Teacher{} = teacher) do
    Repo.delete(teacher)
  end

  @doc """
  Returns an `%Ecto.Changeset{}` for tracking teacher changes.

  ## Examples

      iex> change_teacher(teacher)
      %Ecto.Changeset{data: %Teacher{}}

  """
  def change_teacher(%Teacher{} = teacher, attrs \\ %{}) do
    Teacher.changeset(teacher, attrs)
  end

  alias Escola.Profile.Support

  @doc """
  Returns the list of supports.

  ## Examples

      iex> list_supports()
      [%Support{}, ...]

  """
  def list_supports do
    Repo.all(Support)
  end

  @doc """
  Gets a single support.

  Raises `Ecto.NoResultsError` if the Support does not exist.

  ## Examples

      iex> get_support!(123)
      %Support{}

      iex> get_support!(456)
      ** (Ecto.NoResultsError)

  """
  def get_support!(id), do: Repo.get!(Support, id)

  @doc """
  Creates a support.

  ## Examples

      iex> create_support(%{field: value})
      {:ok, %Support{}}

      iex> create_support(%{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def create_support(attrs \\ %{}) do
    %Support{}
    |> Support.changeset(attrs)
    |> Repo.insert()
  end

  @doc """
  Updates a support.

  ## Examples

      iex> update_support(support, %{field: new_value})
      {:ok, %Support{}}

      iex> update_support(support, %{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def update_support(%Support{} = support, attrs) do
    support
    |> Support.changeset(attrs)
    |> Repo.update()
  end

  @doc """
  Deletes a support.

  ## Examples

      iex> delete_support(support)
      {:ok, %Support{}}

      iex> delete_support(support)
      {:error, %Ecto.Changeset{}}

  """
  def delete_support(%Support{} = support) do
    Repo.delete(support)
  end

  @doc """
  Returns an `%Ecto.Changeset{}` for tracking support changes.

  ## Examples

      iex> change_support(support)
      %Ecto.Changeset{data: %Support{}}

  """
  def change_support(%Support{} = support, attrs \\ %{}) do
    Support.changeset(support, attrs)
  end
end
