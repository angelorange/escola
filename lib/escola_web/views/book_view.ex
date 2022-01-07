defmodule EscolaWeb.BookView do
  use EscolaWeb, :view

  alias EscolaWeb.BookView

  def render("index.json", %{books: books}) do
    %{data: render_many(books, UserView, "book.json")}
  end

  def render("show.json", %{book: book}) do
    %{data: render_one(book, BookView, "book.json")}
  end

  def render("book.json", %{book: book}) do
    %{
      id: book.id,
      title: book.title,
      summary: book.summary,
      description: book.description
    }
  end
end
