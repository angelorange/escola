defmodule Escola.AccountsTest do
  use Escola.DataCase

  alias Escola.Accounts

  import Escola.Factory

  describe "schools" do
    alias Escola.Accounts.School

    @invalid_attrs %{address: nil, cnpj: nil, name: nil, partnership: nil}

    test "list_schools/0 returns all schools" do
      school = insert(:school)
      assert [subject] = Accounts.list_schools()
    end

    test "get_school!/1 returns the school with given id" do
      school = insert(:school)
      assert Accounts.get_school!(school.id) == school
    end

    test "create_school/1 with valid data creates a school" do
      expected = params_for(:school)

      assert {:ok, %School{} = school} = Accounts.create_school(expected)
      assert school.address == expected.address
      assert school.cnpj == expected.cnpj
      assert school.name == expected.name
      assert school.partnership == expected.partnership
    end

    test "create_school/1 with invalid data returns error changeset" do
      params = params_for(:school, %{
        name: nil,
        address: nil,
        cnpj: nil,
        partnership: nil
      })
      assert {:error, %Ecto.Changeset{}} = Accounts.create_school(params)
    end

    test "update_school/2 with valid data updates the school" do
      school = insert(:school)
      updated = params_for(:school, %{
        name: "colégio helyos",
        cnpj: "9405940695",
        address: "carmen de santana rua",
        partnership: "Instituto caminho da lua"
      })

      assert {:ok, %School{} = school} = Accounts.update_school(school, updated)
      assert school.address == updated.address
      assert school.cnpj == updated.cnpj
      assert school.name == updated.name
      assert school.partnership == updated.partnership
    end

    test "update_school/2 with invalid data returns error changeset" do
      school = insert(:school)

      params = %{
        name: nil,
        address: nil,
        cnpj: nil,
        partnership: nil
      }
      assert {:error, %Ecto.Changeset{}} = Accounts.update_school(school, params)
      assert school == Accounts.get_school!(school.id)
    end

    test "delete_school/1 deletes the school" do
      school = insert(:school)
      assert {:ok, %School{}} = Accounts.delete_school(school)
      assert_raise Ecto.NoResultsError, fn -> Accounts.get_school!(school.id) end
    end

    test "change_school/1 returns a school changeset" do
      school = insert(:school)
      assert %Ecto.Changeset{} = Accounts.change_school(school)
    end
  end
end
