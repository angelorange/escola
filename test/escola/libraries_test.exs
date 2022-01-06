defmodule Escola.LibrariesTest do
  use Escola.DataCase

  alias Escola.Libraries

  import Escola.Factory

  describe "books" do
    alias Escola.Libraries.Book

    test "list_books/0 returns all books" do
      book = insert(:book)

      assert [subject] = Libraries.list_books()
      assert subject.id == book.id
    end

    test "get_book!/1 returns the book with given id" do
      book = insert(:book)
      assert subject = Libraries.get_book!(book.id)
      assert subject.id == book.id
    end

    test "create_book/1 with valid data creates a book" do
      expected = params_with_assocs(:book)

      assert {:ok, %Book{} = book} = Libraries.create_book(expected)
      assert book.description == expected.description
      assert book.summary == expected.summary
      assert book.title == expected.title
    end

    test "create_book/1 with invalid data returns error changeset" do
      params = params_for(:book, %{description: nil, title: nil, summary: nil})
      assert {:error, %Ecto.Changeset{}} = Libraries.create_book(params)
    end

    test "update_book/2 with valid data updates the book" do
      book = insert(:book)
      updated = %{description: "um mlk mago", summary: "fodase", title: "harry potter"}

      assert {:ok, %Book{} = book} = Libraries.update_book(book, updated)
      assert book.description == updated.description
      assert book.summary == updated.summary
      assert book.title == updated.title
    end

    test "update_book/2 with invalid data returns error changeset" do
      book = insert(:book)
      params = %{
        title: nil,
        description: nil,
        summary: nil
      }
      assert {:error, %Ecto.Changeset{}} = Libraries.update_book(book, params)
      assert book == Libraries.get_book!(book.id)
    end

    test "delete_book/1 deletes the book" do
      book = insert(:book)
      assert {:ok, %Book{}} = Libraries.delete_book(book)
      assert_raise Ecto.NoResultsError, fn -> Libraries.get_book!(book.id) end
    end

    test "change_book/1 returns a book changeset" do
      book = insert(:book)
      assert %Ecto.Changeset{} = Libraries.change_book(book)
    end
  end
end
