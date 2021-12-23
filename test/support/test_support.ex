defmodule Escola.TestSupport do
  import Plug.Conn

  alias Escola.Token
  alias Escola.Accounts.User

  def login(conn, %User{} = user) do
    conn
    |> put_req_header("authorization", "Bearer " <> Token.sign(user))
  end

  def login(conn, profile) do
    map = %{user_id: profile.user_id, profile: profile.title, profile_id: profile.id}

    conn
    |> put_req_header("authorization", "Bearer " <> Token.sign(map))
  end
end
