defmodule EscolaWeb.Validator do
  @moduledoc """
  Validate the input data with schemas that implement the module behaviour.
  """

  alias Ecto.Changeset

  @callback changeset(map()) :: Changeset.t()

  @doc """
  Validate the input data with the provided schema

  ## Examples
        iex> Validator.validate(Request.Input, params)
        {:ok, params}
  """
  @spec validate(atom(), any()) :: {:ok, map()} | {:error, Error.t()}
  def validate(validator, data) do
    data
    |> validator.changeset()
    |> Changeset.apply_action(:validate)
    |> handle_validation()
  end

  defp handle_validation({:ok, struct}), do: {:ok, Map.from_struct(struct)}

  defp handle_validation({:error, changeset}) do
    {:error,  changeset}
  end
end
