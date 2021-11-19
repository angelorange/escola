defmodule EscolaWeb.UserControllerTest do
  use EscolaWeb.ConnCase

  alias Escola.Accounts.User

  import Escola.Factory

  setup %{conn: conn} do
    {:ok, conn: put_req_header(conn, "accept", "application/json")}
  end

  describe "index" do
    test "list all users", %{conn: conn} do
      conn = get(conn, Routes.user_path(conn, :index))
      assert json_response(conn, 200)["data"] == []
    end
  end

  describe "create user" do
    test "renders user when data is valid", %{conn: conn} do
      user = params_for(:user)

      conn = post(conn, Routes.user_path(conn, :create), user: user)

      assert expected = json_response(conn, 201)["data"]
      assert expected["name"] == user.name
      assert expected["email"] == user.email
      assert expected["password"] == user.password
    end
  end

  describe "update user" do
    test "renders user when data is valid", %{conn: conn} do
    user = insert(:user)
      params = %{
        name: user.name,
        email: user.email,
        password: user.password
      }

      conn = put(conn, Routes.user_path(conn, :update, user), user: params)
      assert expected = json_response(conn, 200)["data"]
      assert expected["name"] == params.name
    end
  end

  describe "delete user" do

    test "deletes chosen user", %{conn: conn} do
    user = insert(:user)
      conn = delete(conn, Routes.user_path(conn, :delete, user))
      assert response(conn, 204)

      assert_error_sent 404, fn ->
        get(conn, Routes.user_path(conn, :show, user))
      end
    end
  end
end
