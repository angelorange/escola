defmodule Escola.Token do

  alias Escola.Accounts.User
  alias Phoenix.Token

  @signing_salt "Escola_Api"
  # token for 2 week
  @token_age_secs 7 * 86_400

  @doc """
  Create token for given user.
  If you send profile and profile_id, you can sign in with your profile.
  """
  @spec sign(User.t() | map) :: binary()
  def sign(%User{} = user) do
    Token.sign(EscolaWeb.Endpoint, @signing_salt, %{user_id: user.id, profile: nil})
  end

  def sign(%{user_id: _, profile: _, profile_id: _} = map) do
    Token.sign(EscolaWeb.Endpoint, @signing_salt, map)
  end

  @doc """
  Returns the authencity of the token and the information inside it.
  [:user_id, :profile, :profile_id]
  """
  @spec verify(String.t()) :: {:ok, map} | {:error, :unauthenticated}
  def verify(token) do
    case Token.verify(EscolaWeb.Endpoint, @signing_salt, token, max_age: @token_age_secs) do
      {:ok, data} -> {:ok, data}
      _error -> {:error, :unauthenticated}
    end
  end
end
