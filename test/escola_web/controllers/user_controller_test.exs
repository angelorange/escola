defmodule EscolaWeb.UserControllerTest do
  use EscolaWeb.ConnCase, async: true

  import Escola.Factory

  setup %{conn: conn} do
    user = insert(:user)
    {:ok, conn: put_req_header(conn, "accept", "application/json"), user: user}
  end

  describe "index" do
    test "list all users", %{conn: conn, user: user} do
      conn =
        login(conn, user)
        |> get(Routes.user_path(conn, :index))

      assert [expected] = json_response(conn, 200)["data"]
      assert expected["id"] == user.id
    end
  end

  describe "create user" do
    test "renders user when data is valid", %{conn: conn, user: user} do
      params = params_for(:user)

      conn =
        login(conn, user)
        |> post(Routes.user_path(conn, :create), user: params)

      assert expected = json_response(conn, 201)["data"]
      assert expected["name"] == params.name
      assert expected["email"] == params.email
    end
  end

  describe "update user" do
    test "renders user when data is valid", %{conn: conn, user: admin} do
    user = insert(:user)
      params = %{
        name: user.name,
        email: user.email
      }

      conn =
        login(conn, admin)
        |> put(Routes.user_path(conn, :update, user), user: params)

      assert expected = json_response(conn, 200)["data"]
      assert expected["name"] == params.name
    end
  end

  describe "delete user" do

    test "deletes chosen user", %{conn: conn, user: admin} do
      user = insert(:user)

      conn =
        login(conn, admin)
        |> delete(Routes.user_path(conn, :delete, user))

      assert response(conn, 204)
      assert_error_sent 404, fn ->
        get(conn, Routes.user_path(conn, :show, user))
      end
    end
  end
end
