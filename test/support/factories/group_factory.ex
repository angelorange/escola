defmodule Escola.GroupFactory do
  defmacro __using__(_opts) do
    quote do
      def group_factory do
        %Escola.Accounts.Group{
          title: "turma C",
          year: "2027",
          school: build(:school)
        }
      end
    end
  end
end
