defmodule Escola.Token do

  alias Escola.Accounts.User

  @signing_salt "octosell_api"
  # token for 2 week
  @token_age_secs 14 * 86_400

  @doc """
  Create token for given user
  """
  @spec sign(User.t()) :: binary()
  def sign(%User{} = user) do
    Phoenix.Token.sign(EscolaWeb.Endpoint, @signing_salt, %{user_id: user.id})
  end


  @doc """
  Verify given token by:
  - Verify token signature
  - Verify expiration time
  """
  @spec verify(String.t()) :: {:ok, any()} | {:error, :unauthenticated}
  def verify(token) do
    case Phoenix.Token.verify(EscolaWeb.Endpoint, @signing_salt, token,
             max_age: @token_age_secs
           ) do
      {:ok, data} -> {:ok, data}
      _error -> {:error, :unauthenticated}
    end
  end
end
