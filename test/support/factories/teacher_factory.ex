defmodule Escola.TeacherFactory do
  defmacro __using__(_opts) do
    quote do
      def teacher_factory do
        %Escola.Profile.Teacher{
          title: "teacher",
          year: "2018",
          school: build(:school),
          user: build(:user),
        }
      end
    end
  end
end
