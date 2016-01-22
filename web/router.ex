defmodule ExfileSample.Router do
  use ExfileSample.Web, :router

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

  scope "/", ExfileSample do
    pipe_through :browser # Use the default browser stack

    get "/", PageController, :index
    resources "/users", UserController
  end
  forward "/attachments", Exfile.Router

  # Other scopes may use custom stacks.
  # scope "/api", ExfileSample do
  #   pipe_through :api
  # end
end
