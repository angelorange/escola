defmodule Escola.Factory do
  use ExMachina.Ecto, repo: Escola.Repo

  use Escola.SchoolFactory
  use Escola.UserFactory
  use Escola.StudentFactory
  use Escola.TeacherFactory
  use Escola.SupportFactory
  use Escola.DisciplineFactory
  use Escola.GroupFactory
  use Escola.TaughtGroupFactory
end
