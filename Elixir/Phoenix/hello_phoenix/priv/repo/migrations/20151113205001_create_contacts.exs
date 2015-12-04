defmodule HelloPhoenix.Repo.Migrations.CreateContacts do
  use Ecto.Migration

  def up do
    create table(:contacts) do
      add :name, :string
      add :phone, :string

      timestamps
    end
  end

  def down do
    drop table(:contacts)
  end
end
