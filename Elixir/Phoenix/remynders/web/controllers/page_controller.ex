defmodule Remynders.PageController do
  use Remynders.Web, :controller

  def index(conn, _params) do
    render conn, "index.html"
  end
end
