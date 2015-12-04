defmodule HelloPhoenix.ContactController do
  use HelloPhoenix.Web, :controller

  #alias HelloPhoenix.Repo
  alias HelloPhoenix.Contact

  def index(conn, _params) do
    contacts = Repo.all(Contact)
    render conn, "index.json", contacts: contacts
  end
end
