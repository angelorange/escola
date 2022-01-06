defmodule EscolaWeb.AuthorController do
  use EscolaWeb, :controller

  alias Escola.Profile.Author
  alias Escola.Profile

  action_fallback EscolaWeb.FallbackController

  def index(conn, _params) do
    authors = Profile.list_authors()
    render(conn, "index.json", authors: authors)
  end

  def show(conn, %{"id" => id}) do
    author = Profile.get_author!(id)
    render(conn, "show.json", author: author)
  end

  def delete(conn, %{"id" => id}) do
    author = Profile.get_author!(id)

    with {:ok, %Author{}} <- Profile.delete_author(author) do
      send_resp(conn, :no_content, "")
    end
  end
end
