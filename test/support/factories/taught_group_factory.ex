defmodule Escola.TaughtGroupFactory do
  defmacro __using__(_opts) do
    quote do
      def taught_group_factory do
        %Escola.Lectures.TaughtGroup{
          discipline: build(:discipline),
          group: build(:group),
          teacher: build(:teacher),
        }
      end
    end
  end
end
