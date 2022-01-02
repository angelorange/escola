defmodule Escola.AccountsTest do
  use Escola.DataCase, async: true

  alias Escola.Accounts

  import Escola.Factory

  describe "schools" do
    alias Escola.Accounts.School

    test "list_schools/0 returns all schools" do
      school = insert(:school)

      assert [subject] = Accounts.list_schools()
      assert subject.id == school.id
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

  describe "users" do
    alias Escola.Accounts.User

    test "list_users/0 returns all users" do
      user = insert(:user)

      assert [subject] = Accounts.list_users()
      assert subject.id == user.id
    end

    test "get_user!/1 returns the user with given id" do
      user = insert(:user)
      assert Accounts.get_user!(user.id) == user
    end

    test "create_user/1 with valid data creates a user" do
      expected = params_for(:user, email: "M@gm.com ")

      assert {:ok, %User{} = user} = Accounts.create_user(expected)
      assert user.email == "m@gm.com"
      assert user.name == expected.name
      assert Bcrypt.verify_pass(expected.password, user.password)
    end

    test "create_user/1 with invalid data returns error changeset" do
      params = params_for(:user, %{
        email: nil,
        name: nil,
        password: nil
      })
      assert {:error, %Ecto.Changeset{}} = Accounts.create_user(params)
    end

    test "update_user/2 with valid data updates the user" do
      user = insert(:user)
      updated = %{email: "vitor@gmail.com", name: "vitor"}

      assert {:ok, %User{} = user} = Accounts.update_user(user, updated)
      assert user.email == updated.email
      assert user.name == updated.name
    end

    test "update_user/2 with invalid data returns error changeset" do
      user = insert(:user)
      params = %{
        name: nil,
        email: nil,
        password: nil
      }

      assert {:error, %Ecto.Changeset{}} = Accounts.update_user(user, params)
      assert user == Accounts.get_user!(user.id)
    end
''
    test "delete_user/1 deletes the user" do
      user = insert(:user)
      assert {:ok, %User{}} = Accounts.delete_user(user)
      assert_raise Ecto.NoResultsError, fn -> Accounts.get_user!(user.id) end
    end

    test "change_user/1 returns a user changeset" do
      user = insert(:user)
      assert %Ecto.Changeset{} = Accounts.change_user(user)
    end
  end

  describe "groups" do
    alias Escola.Accounts.Group

    test "list_groups/0 returns all groups" do
      group = insert(:group)
      assert [subject] = Accounts.list_groups()
      assert subject.id == group.id
    end

    test "get_group!/1 returns the group with given id" do
      group = insert(:group)
      assert subject = Accounts.get_group!(group.id)
    end

    test "create_group/1 with valid data creates a group" do
      expected = params_with_assocs(:group)

      assert {:ok, %Group{} = group} = Accounts.create_group(expected)
      assert group.title == expected.title
      assert group.year == expected.year
    end

    test "create_group/1 with invalid data returns error changeset" do
      params = params_for(:group, %{
        title: nil,
        year: nil,
        school_id: nil
      })
      assert {:error, %Ecto.Changeset{}} = Accounts.create_group(params)
    end

    test "update_group/2 with valid data updates the group" do
      group = insert(:group)
      updated = params_for(:group, %{title: "turma A", year: "2022"})

      assert {:ok, %Group{} = group} = Accounts.update_group(group, updated)
      assert group.title == updated.title
      assert group.year == updated.year
    end

    test "update_group/2 with invalid data returns error changeset" do
      group = insert(:group)
      params = %{
        title: nil,
        year: nil,
        school_id: nil
      }
      assert {:error, %Ecto.Changeset{}} = Accounts.update_group(group, params)
    end

    test "delete_group/1 deletes the group" do
      group = insert(:group)
      assert {:ok, %Group{}} = Accounts.delete_group(group)
      assert_raise Ecto.NoResultsError, fn -> Accounts.get_group!(group.id) end
    end

    test "change_group/1 returns a group changeset" do
      group = insert(:group)
      assert %Ecto.Changeset{} = Accounts.change_group(group)
    end
  end
end
