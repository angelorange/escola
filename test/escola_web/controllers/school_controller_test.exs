defmodule EscolaWeb.SchoolControllerTest do
  use EscolaWeb.ConnCase, async: true

  alias Escola.Accounts.School

  import Escola.Factory

  setup %{conn: conn} do
    {:ok, conn: put_req_header(conn, "accept", "application/json")}
  end

  describe "index" do
    test "lists all schools", %{conn: conn} do
      conn = get(conn, Routes.school_path(conn, :index))
      assert json_response(conn, 200)["data"] == []
    end
  end

  describe "create school" do
    test "renders school when data is valid", %{conn: conn} do
      school = params_for(:school)

      conn = post(conn, Routes.school_path(conn, :create), school: school)

      assert expected = json_response(conn, 201)["data"]
      assert expected["address"] == school.address
      assert expected["cnpj"] == school.cnpj
      assert expected["name"] == school.name
    end

    test "renders errors when data is invalid", %{conn: conn} do
      params = %{
        name: nil,
        address: nil,
        cnpj: nil,
        partnership: nil
      }
      conn = post(conn, Routes.school_path(conn, :create), school: params)
      assert json_response(conn, 422)["errors"] != %{}
    end
  end

  describe "update school" do
    setup [:create_school]

    test "renders school when data is valid", %{conn: conn, school: %School{id: _id} = school} do
      params = %{
        name: school.name,
        cnpj: school.cnpj,
        address: school.address,
        partnership: school.partnership
      }
      conn = put(conn, Routes.school_path(conn, :update, school), school: params)

      assert expected = json_response(conn, 200)["data"]
      assert expected["name"] == params.name
      assert expected["cnpj"] == params.cnpj
      assert expected["partnership"] == params.partnership
      assert expected["address"] == params.address
    end

    test "renders errors when data is invalid", %{conn: conn, school: school} do
      params = %{
        name: nil,
        address: nil,
        cnpj: nil,
        partnership: nil
      }
      conn = put(conn, Routes.school_path(conn, :update, school), school: params)
      assert json_response(conn, 422)["errors"] != %{}
    end
  end

  describe "delete school" do
    setup [:create_school]

    test "deletes chosen school", %{conn: conn, school: school} do
      conn = delete(conn, Routes.school_path(conn, :delete, school))
      assert response(conn, 204)

      assert_error_sent 404, fn ->
        get(conn, Routes.school_path(conn, :show, school))
      end
    end
  end

  defp create_school(_) do
    school = insert(:school)
    %{school: school}
  end
end
