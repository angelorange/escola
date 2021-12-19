defmodule EscolaWeb.Router do
  use EscolaWeb, :router

  pipeline :api do
    plug :accepts, ["json"]
  end

  pipeline :jwt do
    plug EscolaWeb.Plugs.JwtAuth
  end

  scope "/api", EscolaWeb do
    pipe_through :api

    post "/token", TokenController, :create
  end

  scope "/api", EscolaWeb do
    pipe_through [:api, :jwt]

    put "/token", TokenController, :update
    get "/token", TokenController, :index
    resources "/schools", SchoolController, except: [:new, :edit]
    resources "/users", UserController, except: [:new, :edit]
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
