defmodule Escola.TaughtGroupFactory do
  defmacro __using__(_opts) do
    quote do
      def taught_group_factory do
        %Escola.Accounts.TaughtGroup{
          discipline_id: build(:discipline).id,
          group_id: build(:group).id,
          teacher_id: build(:teacher).id,
        }
      end
    end
  end
end
