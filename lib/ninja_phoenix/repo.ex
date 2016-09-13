defmodule NinjaPhoenix.Repo do
#  use Ecto.Repo, otp_app: :ninja_phoenix
  @moduledoc """
  In memory Repository
  """
  #pre-ex: iex -S mix phoenix.server
  #NinjaPhoenix.User
  #NinjsPhoenix.Repo
  #ex: Repo.get User, "3"
  def get(module, id) do
    Enum.find all(module), fn map -> map.id == id end
  end

  #ex: Repo.get_by User,name: "Carmen"
  def get_by(module, params) do
    Enum.find all(module), fn map ->
      Enum.all?(params, fn {key, val} -> Map.get(map, key) == val end)
    end
  end
  #ex:Repo.all User
  def all(NinjaPhoenix.User) do
    [
      %NinjaPhoenix.User{id: "1", name: "Jose", username: "josevalim", password: "elixir"},
      %NinjaPhoenix.User{id: "2", name: "Bruce", username: "redrapids", password: "7langs"},
      %NinjaPhoenix.User{id: "3", name: "Chris", username: "chrismccord", password: "phx"},
      %NinjaPhoenix.User{id: "4", name: "Carmen", username: "carmen0208", password: "elixir"}
    ]
  end

  def all(_module), do: []
end
