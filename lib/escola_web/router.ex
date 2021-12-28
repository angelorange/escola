defmodule EscolaWeb.Router do
  use EscolaWeb, :router

  pipeline :api do
    plug :accepts, ["json"]
  end

  pipeline :jwt do
    plug EscolaWeb.Plugs.JwtAuth
  end

  pipeline :support_auth do
    plug EscolaWeb.Plugs.JwtAuth
    plug  EscolaWeb.Plugs.SupportAuth
  end

  scope "/api", EscolaWeb do
    pipe_through :api

    post "/token", TokenController, :create
  end

  scope "/api", EscolaWeb do
    pipe_through [:api, :jwt]

    put "/token", TokenController, :update
    get "/profiles", TokenController, :index

    resources "/schools", SchoolController, only: [:index, :show]
    resources "/users", UserController, only: [:index, :show]
    resources "/teachers", TeacherController, only: [:index, :show]
    resources "/students", StudentController, only: [:index, :show]
  end

  scope "/api", EscolaWeb do
    pipe_through [:api, :support_auth]

    resources "/schools", SchoolController, only: [:update, :create, :delete]
    resources "/users", UserController, only: [:update, :create, :delete]
    resources "/students", StudentController, only: [:delete, :update, :create]
    resources "/teachers", TeacherController, only: [:delete, :update, :create]
  end


  if Mix.env() in [:dev, :test] do
    import Phoenix.LiveDashboard.Router

    scope "/" do
      pipe_through [:fetch_session, :protect_from_forgery]
      live_dashboard "/dashboard", metrics: EscolaWeb.Telemetry
    end
  end

  # Enables the Swoosh mailbox preview in development.
  #
  # Note that preview only shows emails that were sent by the same
  # node running the Phoenix server.
  if Mix.env() == :dev do
    scope "/dev" do
      pipe_through [:fetch_session, :protect_from_forgery]

      forward "/mailbox", Plug.Swoosh.MailboxPreview
    end
  end
end
