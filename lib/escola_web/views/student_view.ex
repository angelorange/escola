defmodule EscolaWeb.StudentView do
  use EscolaWeb, :view

  alias EscolaWeb.StudentView

  def render("index.json", %{students: students}) do
    %{data: render_many(students, StudentView, "student.json")}
  end

  def render("show.json", %{student: student}) do
    %{data: render_one(student, StudentView, "student.json")}
  end

  def render("student.json", %{student: student}) do
    %{
      id: student.id,
      title: student.title,
      year: student.year,
    }
  end
end
