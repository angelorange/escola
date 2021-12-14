defmodule Escola.TestSupport do
  import Plug.Conn

  alias Escola.Token

  def login(conn, user) do
    conn
    |> put_req_header("authorization", "Bearer " <> Token.sign(user))
  end
end
