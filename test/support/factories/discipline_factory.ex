defmodule Escola.DisciplineFactory do
  defmacro __using__(_opts) do
    quote do
      def discipline_factory do
        %Escola.Trait.Discipline{
          title: "Matematica"
        }
      end
    end
  end
end
