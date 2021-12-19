defmodule EscolaWeb.TokenView do
  use EscolaWeb, :view

  def render("index.json", %{profiles: profiles}) do
    %{data: render_many(profiles, __MODULE__, "profile.json")}
  end

  # def render("index.json", %{survivors: survivors}) do
  #   %{data: render_many(survivors, SurvivorView, "survivor.json")}
  # end

  def render("profile.json", %{token: token}) do
    %{
      id: token.id,
      title: token.title,
      year: token.year
    }
  end
end
