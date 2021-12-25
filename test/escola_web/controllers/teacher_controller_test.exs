defmodule EscolaWeb.TeacherControllerTest do
  use EscolaWeb.ConnCase, async: true

  alias Escola.Profile.Teacher

  import Escola.Factory

  setup %{conn: conn} do
    support = insert(:support)

    {:ok, conn: put_req_header(conn, "accept", "application/json"), support: support}
  end

  describe "index" do
    test "list all teachers, as support", %{conn: conn, support: support} do
      teacher = insert(:teacher)

      conn =
        login(conn, support)
        |> get(Routes.teacher_path(conn, :index))

      assert [expected] = json_response(conn, 200)["data"]
    end
  end

  describe "create teacher" do
    test "renders teacher when data is valid, as support", %{conn: conn, support: support} do
      school = insert(:school)
      user = insert(:user)
      teacher = params_for(:teacher, %{school_id: school.id, user_id: user.id})

      conn =
        login(conn, support)
        |> post(Routes.teacher_path(conn, :create), teacher: teacher)

      assert expected = json_response(conn, 201)["data"]
      assert expected["title"] == teacher.title
    end
  end

  describe "update teacher" do
    test "renders teacher when data is valid", %{conn: conn, support: support} do
    teacher = insert(:teacher)
      params = %{
        title: teacher.title,
        year: teacher.year
      }

      conn =
        login(conn, support)
        |> put(Routes.teacher_path(conn, :update, teacher), teacher: params)

      assert expected = json_response(conn, 200)["data"]
      assert expected["title"] == params.title
    end
  end

  describe "delete teacher" do

    test "deletes chosen teacher", %{conn: conn, support: support} do
      teacher = insert(:teacher)

      conn =
        login(conn, support)
        |> delete(Routes.teacher_path(conn, :delete, teacher))

      assert response(conn, 204)
      assert_error_sent 404, fn ->
        get(conn, Routes.teacher_path(conn, :show, teacher))
      end
    end
  end
end
