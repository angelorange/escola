defmodule Escola.GradeFactory do
  defmacro __using__(_opts) do
    quote do
      def grade_factory do
        %Escola.Lectures.Grade{
          title: "turma C"
        }
      end
    end
  end
end
