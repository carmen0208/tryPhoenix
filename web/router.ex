defmodule NinjaPhoenix.Router do
  use NinjaPhoenix.Web, :router

  pipeline :browser do
    plug :accepts, ["html"]
    plug :fetch_session
    plug :fetch_flash
    plug :protect_from_forgery
    plug :put_secure_browser_headers
  end

  pipeline :api do
    plug :accepts, ["json"]
  end

  scope "/", NinjaPhoenix do
    pipe_through :browser # Use the default browser stack

    get "/", PageController, :index
    get "/hello", HelloController, :world
    get "/hello/:name", HelloController, :world

  end


  # Other scopes may use custom stacks.
  # scope "/api", NinjaPhoenix do
  #   pipe_through :api
  # end
end
