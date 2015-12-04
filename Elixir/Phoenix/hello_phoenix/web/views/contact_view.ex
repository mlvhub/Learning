defmodule HelloPhoenix.ContactView do
  use HelloPhoenix.Web, :view

  def render("index.json", %{contacts: contacts}) do
    %{data: render_many(contacts, HelloPhoenix.ContactView, "contact.json")}
  end
end
