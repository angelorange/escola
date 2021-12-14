defmodule EscolaWeb.Plugs.JwtAuth do
  import Plug.Conn

  def init(options), do: options

  @spec call(Conn.t(), term()) :: Conn.t()
  def call(conn, _opts) do
    with ["Bearer " <> token] <- get_req_header(conn, "authorization"),
      {:ok, user_id} <- Escola.Token.verify(token) do
      conn
      |> assign(:current_user_id, user_id)
    else
      _ ->
        conn
        |> put_status(:unauthorized)
        |> Phoenix.Controller.put_view(EscolaWeb.ErrorView)
        |> Phoenix.Controller.render(:"401")
        |> halt()
    end
  end
end
