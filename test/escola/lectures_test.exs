defmodule Escola.LecturesTest do
  use Escola.DataCase

  alias Escola.Lectures

  import Escola.Factory

  describe "disciplines" do
    alias Escola.Lectures.Discipline

    test "list_disciplines/0 returns all disciplines" do
      discipline = insert(:discipline)

      assert [subject] = Lectures.list_disciplines()
      assert subject.id == discipline.id
    end

    test "get_discipline!/1 returns the discipline with given id" do
      discipline = insert(:discipline)

      assert Lectures.get_discipline!(discipline.id) == discipline
    end

    test "create_discipline/1 with valid data creates a discipline" do
      expected = params_for(:discipline)


      assert {:ok, %Discipline{} = discipline} = Lectures.create_discipline(expected)
      assert discipline.title == expected.title
    end

    test "create_discipline/1 with invalid data returns error changeset" do
      params = params_for(:discipline, %{
        title: nil
      })
      assert {:error, %Ecto.Changeset{}} = Lectures.create_discipline(params)
    end

    test "update_discipline/2 with valid data updates the discipline" do
      discipline = insert(:discipline)
      updated = %{title: "Portugues"}

      assert {:ok, %Discipline{} = discipline} = Lectures.update_discipline(discipline, updated)
      assert discipline.title == updated.title
    end

    test "update_discipline/2 with invalid data returns error changeset" do
      discipline = insert(:discipline)

      params = %{title: nil}
      assert {:error, %Ecto.Changeset{}} = Lectures.update_discipline(discipline, params)
      assert discipline == Lectures.get_discipline!(discipline.id)
    end

    test "delete_discipline/1 deletes the discipline" do
      discipline = insert(:discipline)
      assert {:ok, %Discipline{}} = Lectures.delete_discipline(discipline)
      assert_raise Ecto.NoResultsError, fn -> Lectures.get_discipline!(discipline.id) end
    end

    test "change_discipline/1 returns a discipline changeset" do
      discipline = insert(:discipline)
      assert %Ecto.Changeset{} = Lectures.change_discipline(discipline)
    end
  end

  describe "taught_groups" do
    alias Escola.Lectures.TaughtGroup

    test "list_taught_groups/0 returns all taught_groups" do
      taught_group = insert(:taught_group)

      assert [subject] = Lectures.list_taught_groups()
      assert subject.id == taught_group.id
    end

    test "get_taught_group!/1 returns the taught_group with given id" do
      taught_group = insert(:taught_group)
      assert subject = Lectures.get_taught_group!(taught_group.id)
      assert subject.id == taught_group.id
    end

    test "create_taught_group/1 with valid data creates a taught_group" do
      expected = params_with_assocs(:taught_group)

      assert {:ok, %TaughtGroup{} = taught_group} = Lectures.create_taught_group(expected)
      assert taught_group.discipline_id == expected.discipline_id
    end

    test "create_taught_group/1 with invalid data returns error changeset" do
      params = params_for(:taught_group, %{
        group_id: nil,
        teacher_id: nil,
        discipline_id: nil
      })

      assert {:error, %Ecto.Changeset{}} = Lectures.create_taught_group(params)
    end

    test "update_taught_group/2 with valid data updates the taught_group" do
      discipline = insert(:discipline)
      taught_group = insert(:taught_group)
      updated = params_for(:taught_group, %{discipline_id: discipline.id})

      assert {:ok, %TaughtGroup{} = taught_group} = Lectures.update_taught_group(taught_group, updated)
      assert taught_group.discipline_id == updated.discipline_id
    end

    test "update_taught_group/2 with invalid data returns error changeset" do
      taught_group = insert(:taught_group)
      params = %{
        discipline_id: nil,
        group_id: nil,
        teacher_id: nil
      }
      assert {:error, %Ecto.Changeset{}} = Lectures.update_taught_group(taught_group, params)
      assert subject = Lectures.get_taught_group!(taught_group.id)
      assert subject.id == taught_group.id
    end

    test "delete_taught_group/1 deletes the taught_group" do
      taught_group = insert(:taught_group)
      assert {:ok, %TaughtGroup{}} = Lectures.delete_taught_group(taught_group)
      assert_raise Ecto.NoResultsError, fn -> Lectures.get_taught_group!(taught_group.id) end
    end

    test "change_taught_group/1 returns a taught_group changeset" do
      taught_group = insert(:taught_group)
      assert %Ecto.Changeset{} = Lectures.change_taught_group(taught_group)
    end
  end
end
