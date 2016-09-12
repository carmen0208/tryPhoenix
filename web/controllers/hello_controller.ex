
defmodule NinjaPhoenix.HelloController do
  use NinjaPhoenix.Web, :controller

  def world(conn, %{"name"=>name}) do
    render conn, "world.html", name: name
  end
  def world(conn, _) do
    render conn, "world.html", name: "carmen"
  end

end
