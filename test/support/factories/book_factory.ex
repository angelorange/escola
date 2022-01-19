defmodule Escola.BookFactory do
  defmacro __using__(_opts) do
    quote do
      def book_factory do
        %Escola.Libraries.Book{
          title: "percy jackson",
          summary: "nao sei",
          description: "um mlk filho de poseidon",
          discipline: build(:discipline),
          grade: build(:grade)
        }
      end
    end
  end
end
