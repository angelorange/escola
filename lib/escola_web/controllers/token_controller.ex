defmodule EscolaWeb.TokenController do
  use EscolaWeb, :controller

  alias Escola.Accounts
  alias Escola.Profile

  action_fallback EscolaWeb.FallbackController

  def create(conn, params) do
    with {:ok, user} <- Accounts.auth_user(params["email"], params["password"]) do
      conn
      |> put_status(201)
      |> json(%{token: Escola.Token.sign(user)})
    end
  end

  def update(conn, %{"profile" => profile, "profile_id" => profile_id}) do
    user_id = conn.assigns.current_user.user_id

    with {:ok, profile} <- Profile.get_profile(profile, profile_id) do
      token = Escola.Token.sign(%{user_id: user_id, profile: profile.title, profile_id: profile.id})
      json(conn, %{token: token})
    end
  end

  def index(conn, _params) do
    user_id = conn.assigns.current_user.user_id

    profile_student = Profile.list_student_by_user(user_id)
    profile_teacher = Profile.list_teacher_by_user(user_id)
    profile_support = Profile.list_support_by_user(user_id)

    profiles = [profile_student, profile_support, profile_teacher] |> List.flatten()
    render(conn, "index.json", profiles: profiles)
  end
end
