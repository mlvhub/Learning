defmodule HelloPhoenix.ContactControllerTest do
  use HelloPhoenix.ConnCase

  alias HelloPhoenix.Contact

  setup do
    conn = conn() |> put_req_header("accept", "application/json")
    {:ok, conn: conn}
  end

  test "lists all entries on index", %{conn: conn} do
    conn = get conn, contact_path(conn, :index)
    assert json_response(conn, 200)["data"] == []
  end

end
