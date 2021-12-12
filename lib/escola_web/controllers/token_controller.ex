defmodule EscolaWeb.TokenController do
  use EscolaWeb, :controller

  alias Escola.Accounts

  action_fallback EscolaWeb.FallbackController

  def create(conn, params) do
    with {:ok, user} <- Accounts.auth_user(params["email"], params["password"]) do
      conn
      |> put_status(201)
      |> json(%{token: Escola.Token.sign(user)})
    end
  end
end
