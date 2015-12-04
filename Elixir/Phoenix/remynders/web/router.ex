defmodule Remynders.Router do
  use Remynders.Web, :router

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

  scope "/", Remynders do
    pipe_through :browser # Use the default browser stack

    get "/", PageController, :index
    resources "/reminders", ReminderController
  end

  # Other scopes may use custom stacks.
  # scope "/api", Remynders do
  #   pipe_through :api
  # end
end
