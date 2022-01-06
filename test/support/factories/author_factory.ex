defmodule Escola.AuthorFactory do
  defmacro __using__(_opts) do
    quote do
      def author_factory do
        %Escola.Profile.Author{
          title: "author0",
          user: build(:user)
        }
      end
    end
  end
end
