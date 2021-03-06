defmodule EscolaWeb.UserController do
  use EscolaWeb, :controller

  alias Escola.Accounts
  alias Escola.Accounts.User

  action_fallback EscolaWeb.FallbackController

  def index(conn, _params) do
    users = Accounts.list_users()
    render(conn, "index.json", users: users)
  end

  def create(conn, %{"user" => user_params}) do
    with {:ok, params} <- EscolaWeb.Validator.validate(EscolaWeb.Validators.User.Create, user_params),
      {:ok, %User{} = user} <- Accounts.create_user(params) do

      conn
      |> put_status(:created)
      |> put_resp_header("location", Routes.user_path(conn, :show, user))
      |> render("show.json", user: user)
    end
  end

  def show(conn, %{"id" => id}) do
    user = Accounts.get_user!(id)
    render(conn, "show.json", user: user)
  end

  def update(conn, %{"id" => id, "user" => user_params}) do
    user = Accounts.get_user!(id)

    with {:ok, %User{} = user} <- Accounts.update_user(user, user_params) do
      render(conn, "show.json", user: user)
    end
  end

  def delete(conn, %{"id" => id}) do
    user = Accounts.get_user!(id)

    with {:ok, %User{}} <- Accounts.delete_user(user) do
      send_resp(conn, :no_content, "")
    end
  end

  # def register(conn, %{"user" => user_params}) do
  #   with {:ok, user} <- Accounts.create_user(user_params) do
  #     conn
  #     |> put_status(:created)
  #     |> text("User successfully registered with email:" <> " " <> user.email)
  #   end
  # end
end
