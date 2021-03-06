defmodule Escola.ProfileTest do
  use Escola.DataCase, async: true

  alias Escola.Profile

  import Escola.Factory


  describe "students" do
    alias Escola.Profile.Student

    test "list_students/0 returns all students" do
      student = insert(:student)
      assert [subject] = Profile.list_students()
      assert subject.id == student.id
    end

    test "get_student!/1 returns the student with given id" do
      student = insert(:student)
      assert subject = Profile.get_student!(student.id)
      assert subject.id == student.id
    end

    test "create_student/1 with valid data creates a student" do
      expected = params_with_assocs(:student)

      assert {:ok, %Student{} = student} = Profile.create_student(expected)
      assert student.ra == expected.ra
      assert student.year == expected.year
    end

    test "create_student/1 with valid data required" do
      school = insert(:school)
      insert(:student, %{ra: "123", year: "2018", school: school})
      args = params_with_assocs(:student, %{ra: "123", year: "2018"}) |> Map.merge(%{school_id: school.id})

      assert {:error, %Ecto.Changeset{}} = Profile.create_student(args)
    end

    test "create_student/1 with invalid data returns error changeset" do
      params = params_for(:student, %{
        year: nil,
        ra: nil,
        school_id: nil,
        user_id: nil
      })
      assert {:error, %Ecto.Changeset{}} = Profile.create_student(params)
    end

    test "update_student/2 with valid data updates the student" do
      student = insert(:student)
      updated = params_for(:student, %{
        ra: "12345",
        year: "2020",
      })

      assert {:ok, %Student{} = student} = Profile.update_student(student, updated)
      assert student.ra == updated.ra
      assert student.year == updated.year
    end

    test "update_student/2 with invalid data returns error changeset" do
      student = insert(:student)
      params = %{
        ra: nil,
        year: nil,
        school_id: nil,
        user_id: nil
      }
      assert {:error, %Ecto.Changeset{}} = Profile.update_student(student, params)
      assert subject = Profile.get_student!(student.id)
      assert subject.id == student.id
    end

    test "delete_student/1 deletes the student" do
      student = insert(:student)
      assert {:ok, %Student{}} = Profile.delete_student(student)
      assert_raise Ecto.NoResultsError, fn -> Profile.get_student!(student.id) end
    end

    test "change_student/1 returns a student changeset" do
      student = insert(:student)
      assert %Ecto.Changeset{} = Profile.change_student(student)
    end
  end

  describe "teachers" do
    alias Escola.Profile.Teacher

    test "list_teachers/0 returns all teachers" do
      teacher = insert(:teacher)
      assert [subject] = Profile.list_teachers()
      assert subject.id == teacher.id
    end

    test "get_teacher!/1 returns the teacher with given id" do
      teacher = insert(:teacher)
      assert subject = Profile.get_teacher!(teacher.id)
      assert subject.id == teacher.id
    end

    test "create_teacher/1 with valid data creates a teacher" do
      expected = params_with_assocs(:teacher)

      assert {:ok, %Teacher{} = teacher} = Profile.create_teacher(expected)
      assert teacher.title == expected.title
      assert teacher.year == expected.year
    end

    test "create_teacher/1 with valid unique constraint data" do
      school = insert(:school)
      user = insert(:user)
      insert(:teacher, %{school: school, year: "2019", user: user})
      args = params_with_assocs(:teacher, %{year: "2019"}) |> Map.merge(%{school_id: school.id, user_id: user.id})

      assert {:error, %Ecto.Changeset{}} = Profile.create_teacher(args)
    end

    test "create_teacher/1 with invalid data returns error changeset" do
      params = params_for(:teacher, %{
        year: nil,
        title: nil,
        school_id: nil,
        user_id: nil
      })

      assert {:error, %Ecto.Changeset{}} = Profile.create_teacher(params)
    end

    test "update_teacher/2 with valid data updates the teacher" do
      teacher = insert(:teacher)
      updated = params_for(:teacher, %{
        title: "teacher1",
        year: "2022",
      })

      assert {:ok, %Teacher{} = teacher} = Profile.update_teacher(teacher, updated)
      assert teacher.title == updated.title
      assert teacher.year == updated.year
    end

    test "update_teacher/2 with invalid data returns error changeset" do
      teacher = insert(:teacher)
      params = %{
        title: nil,
        year: nil,
        school_id: nil,
        user_id: nil
      }

      assert {:error, %Ecto.Changeset{}} = Profile.update_teacher(teacher, params)
      assert teacher.id == Profile.get_teacher!(teacher.id).id
    end

    test "delete_teacher/1 deletes the teacher" do
      teacher = insert(:teacher)
      assert {:ok, %Teacher{}} = Profile.delete_teacher(teacher)
      assert_raise Ecto.NoResultsError, fn -> Profile.get_teacher!(teacher.id) end
    end

    test "change_teacher/1 returns a teacher changeset" do
      teacher = insert(:teacher)
      assert %Ecto.Changeset{} = Profile.change_teacher(teacher)
    end
  end

  describe "supports" do
    alias Escola.Profile.Support

    test "list_supports/0 returns all supports" do
      support = insert(:support)
      assert [subject] = Profile.list_supports()
      assert subject.id == support.id
    end

    test "get_support!/1 returns the support with given id" do
      support = insert(:support)
      assert subject = Profile.get_support!(support.id)
      assert subject.id == support.id
    end

    test "create_support/1 with valid data creates a support" do
      expected = params_with_assocs(:support)

      assert {:ok, %Support{} = support} = Profile.create_support(expected)
      assert support.title == expected.title
    end

    test "create_support/1 with invalid data returns error changeset" do
      params = params_for(:support, %{
        title: nil,
        user_id: nil
      })
      assert {:error, %Ecto.Changeset{}} = Profile.create_support(params)
    end

    test "update_support/2 with valid data updates the support" do
      support = insert(:support)
      updated = params_for(:support, %{title: "support"})

      assert {:ok, %Support{} = support} = Profile.update_support(support, updated)
      assert support.title == updated.title
    end

    test "update_support/2 with invalid data returns error changeset" do
      support = insert(:support)
      params = %{
        title: nil,
        user_id: nil
      }
      assert {:error, %Ecto.Changeset{}} = Profile.update_support(support, params)
      assert support.id == Profile.get_support!(support.id).id
    end

    test "delete_support/1 deletes the support" do
      support = insert(:support)
      assert {:ok, %Support{}} = Profile.delete_support(support)
      assert_raise Ecto.NoResultsError, fn -> Profile.get_support!(support.id) end
    end

    test "change_support/1 returns a support changeset" do
      support = insert(:support)
      assert %Ecto.Changeset{} = Profile.change_support(support)
    end
  end

  describe "authors" do
    alias Escola.Profile.Author

    test "list_authors/0 returns all authors" do
      author = insert(:author)
      assert [subject] = Profile.list_authors()
      assert subject.id == author.id
    end

    test "get_author!/1 returns the author with given id" do
      author = insert(:author)
      assert subject = Profile.get_author!(author.id)
      assert subject.id == author.id
    end

    test "create_author/1 with valid data creates a author" do
      expected = params_with_assocs(:author)

      assert {:ok, %Author{} = author} = Profile.create_author(expected)
      assert author.title == expected.title
    end

    test "create_author/1 with invalid data returns error changeset" do
      params = params_for(:author, %{
        title: nil,
        user_id: nil
      })
      assert {:error, %Ecto.Changeset{}} = Profile.create_author(params)
    end

    test "update_author/2 with valid data updates the author" do
      author = insert(:author)
      user = insert(:user)
      updated = params_for(:author, %{
        title: "author1",
        user_id: user.id
      })

      assert {:ok, %Author{} = author} = Profile.update_author(author, updated)
      assert author.title == updated.title
    end

    test "update_author/2 with invalid data returns error changeset" do
      author = insert(:author)
      params = %{
        title: nil,
        user_id: nil
      }
      assert {:error, %Ecto.Changeset{}} = Profile.update_author(author, params)
      assert author.id == Profile.get_author!(author.id).id
    end

    test "delete_author/1 deletes the author" do
      author = insert(:author)
      assert {:ok, %Author{}} = Profile.delete_author(author)
      assert_raise Ecto.NoResultsError, fn -> Profile.get_author!(author.id) end
    end

    test "change_author/1 returns a author changeset" do
      author = insert(:author)
      assert %Ecto.Changeset{} = Profile.change_author(author)
    end
  end
end
