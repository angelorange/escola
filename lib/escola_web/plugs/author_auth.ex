defmodule EscolaWeb.Plugs.AuthorAuth do
  import Plug.Conn

  def init(options), do: options

  def call(conn, _opts) do
    case conn.assigns.current_user.profile do
      "author" ->
        conn

      _ ->
        conn
        |> put_status(:unauthorized)
        |> Phoenix.Controller.put_view(EscolaWeb.ErrorView)
        |> Phoenix.Controller.render(:"401")
        |> halt()
    end
  end
end
