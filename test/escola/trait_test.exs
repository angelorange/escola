defmodule Escola.TraitTest do
  use Escola.DataCase

  alias Escola.Trait

  import Escola.Factory

  describe "disciplines" do
    alias Escola.Trait.Discipline

    test "list_disciplines/0 returns all disciplines" do
      discipline = insert(:discipline)

      assert [subject] = Trait.list_disciplines()
      assert subject.id == discipline.id
    end

    test "get_discipline!/1 returns the discipline with given id" do
      discipline = insert(:discipline)

      assert Trait.get_discipline!(discipline.id) == discipline
    end

    test "create_discipline/1 with valid data creates a discipline" do
      expected = params_for(:discipline)


      assert {:ok, %Discipline{} = discipline} = Trait.create_discipline(expected)
      assert discipline.title == expected.title
    end

    test "create_discipline/1 with invalid data returns error changeset" do
      params = params_for(:discipline, %{
        title: nil
      })
      assert {:error, %Ecto.Changeset{}} = Trait.create_discipline(params)
    end

    test "update_discipline/2 with valid data updates the discipline" do
      discipline = insert(:discipline)
      updated = %{title: "Portugues"}

      assert {:ok, %Discipline{} = discipline} = Trait.update_discipline(discipline, updated)
      assert discipline.title == updated.title
    end

    test "update_discipline/2 with invalid data returns error changeset" do
      discipline = insert(:discipline)

      params = %{title: nil}
      assert {:error, %Ecto.Changeset{}} = Trait.update_discipline(discipline, params)
      assert discipline == Trait.get_discipline!(discipline.id)
    end

    test "delete_discipline/1 deletes the discipline" do
      discipline = insert(:discipline)
      assert {:ok, %Discipline{}} = Trait.delete_discipline(discipline)
      assert_raise Ecto.NoResultsError, fn -> Trait.get_discipline!(discipline.id) end
    end

    test "change_discipline/1 returns a discipline changeset" do
      discipline = insert(:discipline)
      assert %Ecto.Changeset{} = Trait.change_discipline(discipline)
    end
  end
end
