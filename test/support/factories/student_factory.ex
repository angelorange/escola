defmodule Escola.StudentFactory do
  defmacro __using__(_opts) do
    quote do
      def student_factory do
        %Escola.Profile.Student{
          ra: "400434056",
          year: "2018",
          school: build(:school),
          title: "student",
          user: build(:user)
        }
      end
    end
  end
end
