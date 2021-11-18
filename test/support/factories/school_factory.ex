defmodule Escola.SchoolFactory do
  defmacro __using__(_opts) do
    quote do
      def school_factory do
        %Escola.Accounts.School{
          name: "Colégio Iluminar",
          address: "rua marilia mendonça",
          cnpj: "0349305894686",
          partnership: "Rede Objetivo"
        }
      end
    end
  end
end
