defmodule Testapi.UserView do
  use Testapi.Web, :view

  def render("index.json", %{users: users}) do
    %{data: render_many(users, Testapi.UserView, "user.json")}
  end

  def render("show.json", %{user: user}) do
    %{data: render_one(user, Testapi.UserView, "user.json")}
  end

  def render("user.json", %{user: user}) do
    %{id: user.id,
      fullname: user.fullname,
      email: user.email,
      created_at: user.inserted_at,
      updated_at: user.updated_at}
  end
end
