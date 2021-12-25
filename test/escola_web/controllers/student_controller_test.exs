defmodule EscolaWeb.StudentControllerTest do
  use EscolaWeb.ConnCase, async: true

  import Escola.Factory

  setup %{conn: conn} do
    support = insert(:support)

    {:ok, conn: put_req_header(conn, "accept", "application/json"), support: support}
  end

  describe "index" do
    test "list all student, as support", %{conn: conn, support: support} do
      student = insert(:student)

      conn =
        login(conn, support)
        |> get(Routes.student_path(conn, :index))

      assert [expected] = json_response(conn, 200)["data"]
      assert expected["id"] == student.id
    end
  end

  describe "create student" do
    test "renders student when data is valid, as support", %{conn: conn, support: support} do
      school = insert(:school)
      user = insert(:user)
      student = params_for(:student, %{school_id: school.id, user_id: user.id})

      conn =
        login(conn, support)
        |> post(Routes.student_path(conn, :create), student: student)

      assert expected = json_response(conn, 201)["data"]
      assert expected["title"] == student.title
    end
  end

  describe "update student" do
    test "renders student when data is valid", %{conn: conn, support: support} do
    student = insert(:student)
      params = %{
        title: student.title,
        year: student.year,
        ra: student.ra
      }

      conn =
        login(conn, support)
        |> put(Routes.student_path(conn, :update, student), student: params)

      assert expected = json_response(conn, 200)["data"]
      assert expected["title"] == params.title
    end
  end

  describe "delete student" do

    test "deletes chosen student", %{conn: conn, support: support} do
      student = insert(:student)

      conn =
        login(conn, support)
        |> delete(Routes.student_path(conn, :delete, student))

      assert response(conn, 204)
      assert_error_sent 404, fn ->
        get(conn, Routes.student_path(conn, :show, student))
      end
    end
  end
end
