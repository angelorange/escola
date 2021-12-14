defmodule Escola.UserFactory do
  defmacro __using__(_opts) do
    quote do
      def user_factory do
        %Escola.Accounts.User{
          name: "leo santana",
          email: sequence(:email, &"test-#{&1}@example.com"),
          password: "$2b$12$iWNYYuxNcQhaUuJ82jLKu..jbrQQl8..it6K5AvdVovOwDmLX2OVu"
        }
      end
    end
  end
end
