defmodule EscolaWeb.TokenControllerTest do
  use EscolaWeb.ConnCase, async: true

  import Escola.Factory

  setup %{conn: conn} do
    user = insert(:user)

    {:ok, conn: put_req_header(conn, "accept", "application/json"), user: user}
  end

  describe "index" do
    test "returns a list of all profiles for a user", %{conn: conn, user: user} do
      student = insert(:student, %{user: user, year: "2019"})
      student_two = insert(:student, %{year: "2022", user: user})
      insert(:student)

      conn =
        login(conn, user)
        |> get(Routes.token_path(conn, :index))

      assert [expected, expected_two] = json_response(conn, 200)["data"]
      assert expected["id"] == student.id
      assert expected_two["year"] == student_two.year
    end
  end

  describe "create/2" do
    test "returns a token when valid data", %{conn: conn, user: user} do
      params = %{email: user.email, password: "somepassword"}

      conn = post(conn, Routes.token_path(conn, :create, params))

      assert json_response(conn, 201)["token"] =~ "SFMyNTY."
    end
  end

  describe "update/2" do
    test "returns a token w/ a profile when valid data", %{conn: conn, user: user} do
      student = insert(:student)
      params = %{profile: student.title, profile_id: student.id}

      conn =
        login(conn, user)
        |> put(Routes.token_path(conn, :update, params))

      assert expected = json_response(conn, 200)["token"]
      assert {:ok, map} = Escola.Token.verify(expected)
      assert map.profile == params.profile
      assert map.profile_id == params.profile_id
      assert map.user_id == user.id
    end

    test "returns a error when profile doesnt exist", %{conn: conn, user: user} do
      params = %{profile: "admin", profile_id: 1}

      conn =
        login(conn, user)
        |> put(Routes.token_path(conn, :update, params))

      assert "Not Found" == json_response(conn, 404)["errors"]["detail"]
    end

    test "returns a error when profile_id doesnt exist", %{conn: conn, user: user} do
      params = %{profile: insert(:student).title, profile_id: 0}

      conn =
        login(conn, user)
        |> put(Routes.token_path(conn, :update, params))

      assert "Not Found" == json_response(conn, 404)["errors"]["detail"]
    end
  end
end
