defmodule EscolaWeb.TeacherController do
  use EscolaWeb, :controller

  alias Escola.Profile.Teacher
  alias Escola.Profile

  action_fallback EscolaWeb.FallbackController

  def index(conn, _params) do
    teachers = Profile.list_teachers()
    render(conn, "index.json", teachers: teachers)
  end

  def show(conn, %{"id" => id}) do
    teacher = Profile.get_teacher!(id)
    render(conn, "show.json", teacher: teacher)
  end

  def create(conn, %{"teacher" => teacher_params}) do
    with {:ok, %Teacher{} = teacher} <- Profile.create_teacher(teacher_params) do
      conn
      |> put_status(:created)
      |> put_resp_header("location", Routes.user_path(conn, :show, teacher))
      |> render("show.json", teacher: teacher)
    end
  end

  def update(conn, %{"id" => id, "teacher" => teacher_params}) do
    teacher = Profile.get_teacher!(id)

    with {:ok, %Teacher{} = teacher} <- Profile.update_teacher(teacher, teacher_params) do
      render(conn, "show.json", teacher: teacher)
    end
  end

  def delete(conn, %{"id" => id}) do
    teacher = Profile.get_teacher!(id)

    with {:ok, %Teacher{}} <- Profile.delete_teacher(teacher) do
      send_resp(conn, :no_content, "")
    end
  end
end
