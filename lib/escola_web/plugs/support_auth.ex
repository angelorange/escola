defmodule EscolaWeb.Plugs.SupportAuth do
  import Plug.Conn

  def init(options), do: options

  @spec call(Conn.t(), term()) :: Conn.t()
  def call(conn, _opts) do
    conn
  end
end
