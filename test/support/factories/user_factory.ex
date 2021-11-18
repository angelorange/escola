defmodule Escola.UserFactory do
  defmacro __using__(_opts) do
    quote do
      def user_factory do
        %Escola.Accounts.User{
          name: "leo santana",
          email: "leosantana@gmail.com",
          password: "leo123456"
        }
      end
    end
  end
end
