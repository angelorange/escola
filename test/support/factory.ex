defmodule Escola.Factory do
  use ExMachina.Ecto, repo: Escola.Repo

  use Escola.SchoolFactory
  use Escola.UserFactory
  use Escola.StudentFactory
end
