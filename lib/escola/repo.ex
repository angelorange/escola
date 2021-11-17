defmodule Escola.Repo do
  use Ecto.Repo,
    otp_app: :escola,
    adapter: Ecto.Adapters.Postgres
end
