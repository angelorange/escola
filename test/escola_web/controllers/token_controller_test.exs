defmodule EscolaWeb.TokenControllerTest do
  use EscolaWeb.ConnCase, async: true

  import Escola.Factory

  setup %{conn: conn} do
    {:ok, conn: put_req_header(conn, "accept", "application/json"), user: insert(:user)}
  end

  describe "create/2" do
    test "returns a token when valid data", %{conn: conn, user: user} do
      params = %{email: user.email, password: "somepassword"}

      conn = post(conn, Routes.token_path(conn, :create, params))

      assert json_response(conn, 201)["token"] =~ "SFMyNTY"
    end
  end
end
