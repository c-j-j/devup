defmodule Devup.Router do
  use Devup.Web, :router

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

  scope "/", Devup do
    pipe_through :browser # Use the default browser stack

    get "/", PageController, :index

    resources "/users", UserController, only: [:index, :show, :new, :create]

    resources "/subjects", SubjectController, only: [:index, :show]
  end

  # Other scopes may use custom stacks.
  # scope "/api", Devup do
  #   pipe_through :api
  # end
end
