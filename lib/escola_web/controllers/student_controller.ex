defmodule EscolaWeb.StudentController do
  use EscolaWeb, :controller

  alias Escola.Profile.Student
  alias Escola.Profile

  def index(conn, _params) do
    students = Profile.list_students()
    render(conn, "index.json", students: students)
  end

  def show(conn, %{"id" => id}) do
    student = Profile.get_student!(id)
    render(conn, "show.json", student: student)
  end

  def create(conn, %{"student" => student_params}) do
    with {:ok, %Student{} = student} <- Profile.create_student(student_params) do
      conn
      |> put_status(:created)
      |> put_resp_header("location", Routes.student_path(conn, :show, student))
      |> render("show.json", student: student)
    end
  end

  def update(conn, %{"id" => id, "student" => student_params}) do
    student = Profile.get_student!(id)

    with {:ok, %Student{} = student} <- Profile.update_student(student, student_params) do
      render(conn, "show.json", student: student)
    end
  end

  def delete(conn, %{"id" => id}) do
    student = Profile.get_student!(id)

    with {:ok, %Student{}} <- Profile.delete_student(student) do
      send_resp(conn, :no_content, "")
    end
  end
end
