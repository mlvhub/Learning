defmodule Remynders.ReminderController do
  use Remynders.Web, :controller

  plug :action

  def new(conn, _params) do
    render conn, "new.html"
  end
end
