defmodule EscolaWeb.BookControllerTest do
  use EscolaWeb.ConnCase, async: true

  import Escola.Factory

  setup %{conn: conn} do
    author = insert(:author)

    {:ok, conn: put_req_header(conn, "accept", "application/json"), author: author}
  end

  describe "create book" do
    test "renders book when data is valid, As Author", %{conn: conn, author: author} do
      book = params_for(:book)

      conn =
        login(conn, author)
        |> post(Routes.book_path(conn, :create), book: book)

      assert expected = json_response(conn, 201)["data"]
      assert expected["title"] == book.title
      assert expected["summary"] == book.summary
      assert expected["description"] == book.description
    end
  end
end
