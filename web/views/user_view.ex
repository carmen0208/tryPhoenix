defmodule NinjaPhoenix.UserView do
  use NinjaPhoenix.Web, :view
  alias NinjaPhoenix.User
  def first_name(%User{name: name}) do
    name 
    |> String.split(" ")
    |> Enum.at(0)
  end
end
