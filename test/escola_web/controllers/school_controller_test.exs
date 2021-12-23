defmodule EscolaWeb.SchoolControllerTest do
  use EscolaWeb.ConnCase, async: true

  import Escola.Factory

  setup %{conn: conn} do
    support = insert(:support)

    {:ok, conn: put_req_header(conn, "accept", "application/json"),  support: support}
  end

  describe "index" do
    test "lists all schools, as Support", %{conn: conn, support: support} do
      school = insert(:school)

      conn =
        login(conn, support)
        |> get(Routes.school_path(conn, :index))

      assert [subject] = json_response(conn, 200)["data"]
      assert subject["id"] == school.id
    end
  end

  describe "create school" do
    test "renders school when data is valid, as Support", %{conn: conn, support: support} do
      school = params_for(:school)

      conn =
        login(conn, support)
        |> post(Routes.school_path(conn, :create), school: school)

      assert expected = json_response(conn, 201)["data"]
      assert expected["address"] == school.address
      assert expected["cnpj"] == school.cnpj
      assert expected["name"] == school.name
    end

    test "renders errors when data is invalid, as Support", %{conn: conn, support: support} do
      params = %{
        name: nil,
        address: nil,
        cnpj: nil,
        partnership: nil
      }

      conn =
        login(conn, support)
        |> post(Routes.school_path(conn, :create), school: params)

      assert json_response(conn, 422)["errors"] != %{}
    end
  end

  describe "update school" do
    setup [:create_school]

    test "renders school when data is valid, as Support", %{conn: conn, school: school, support: support} do
      params = %{
        name: school.name,
        cnpj: school.cnpj,
        address: school.address,
        partnership: school.partnership
      }
      conn =
        login(conn, support)
        |> put(Routes.school_path(conn, :update, school), school: params)

      assert expected = json_response(conn, 200)["data"]
      assert expected["name"] == params.name
      assert expected["cnpj"] == params.cnpj
      assert expected["partnership"] == params.partnership
      assert expected["address"] == params.address
    end

    test "renders errors when data is invalid, as Support", %{conn: conn, school: school, support: support} do
      params = %{
        name: nil,
        address: nil,
        cnpj: nil,
        partnership: nil
      }
      conn =
        login(conn, support)
        |> put(Routes.school_path(conn, :update, school), school: params)
      assert json_response(conn, 422)["errors"] != %{}
    end
  end

  describe "delete school" do
    setup [:create_school]

    test "deletes chosen school, as Support", %{conn: conn, school: school, support: support} do
      conn =
        login(conn, support)
        |> delete(Routes.school_path(conn, :delete, school))
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
