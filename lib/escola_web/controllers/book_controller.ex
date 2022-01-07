defmodule EscolaWeb.BookController do
  use EscolaWeb, :controller

  alias Escola.Libraries.Book
  alias Escola.Libraries

  action_fallback EscolaWeb.FallbackController


  def create(conn, %{"book" => book_params}) do
    with {:ok, %Book{} = book} <- Libraries.create_book(book_params) do
      conn
      |> put_status(:created)
      |> put_resp_header("location", Routes.user_path(conn, :show, book))
      |> render("show.json", book: book)
    end
  end
end
