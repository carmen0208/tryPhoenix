defmodule NinjaPhoenix.Router do
  use NinjaPhoenix.Web, :router

  pipeline :browser do
    plug :accepts, ["html"]
    plug :fetch_session
    plug :fetch_flash
    plug :protect_from_forgery
    plug :put_secure_browser_headers
    plug NinjaPhoenix.Auth, repo: NinjaPhoenix.Repo
  end

  pipeline :api do
    plug :accepts, ["json"]
  end

  scope "/", NinjaPhoenix do
    pipe_through :browser # Use the default browser stack

    get "/hello", HelloController, :world
    get "/hello/:name", HelloController, :world
    #get "/users", UserController, :index
    #    get "/users/:id", UserController, :show
    resources "/users", UserController, only: [:index, :show, :new, :create]
    resources "/sessions", SessionController, only: [:new, :create, :delete]
    get "/", PageController, :index

  end

  scope "/manage", NinjaPhoenix do
    pipe_through [:browser, :authenticate_user]
    resources "/videos", VideoController
  end


  # Other scopes may use custom stacks.
  # scope "/api", NinjaPhoenix do
  #   pipe_through :api
  # end
end
