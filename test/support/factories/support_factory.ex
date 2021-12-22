defmodule Escola.SupportFactory do
  defmacro __using__(_opts) do
    quote do
      def support_factory do
        %Escola.Profile.Support{
          title: "support",
          user: build(:user)
        }
      end
    end
  end
end
