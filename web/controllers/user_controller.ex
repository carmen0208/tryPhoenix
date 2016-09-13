defmodule NinjaPhoenix.UserController do
  use NinjaPhoenix.Web, :controller

  def index(conn, _parame) do
    users = Repo.all(NinjaPhoenix.User)
    render conn, "index.html", users: users
  end

  def show(conn, %{"id" => id}) do
    user = Repo.get(NinjaPhoenix.User,id)
    render conn, "show.html", user: user
  end
end

