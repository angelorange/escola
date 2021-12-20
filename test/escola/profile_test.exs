defmodule Escola.ProfileTest do
  use Escola.DataCase

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
end
