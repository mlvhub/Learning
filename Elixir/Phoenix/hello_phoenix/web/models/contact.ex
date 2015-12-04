defmodule HelloPhoenix.Contact do
  use Ecto.Model

  @derive {Poison.Encoder, only: [:id, :name, :phone]}
  schema "contacts" do
    field :name
    field :phone

    timestamps
  end
end

defimpl Poison.Encoder, for: HelloPhoenix.Contact do
  def encode(model, opts) do
    IO.puts "ENCODE"
    model
    |> Map.take([:name, :id, :phone])
    |> Poison.Encoder.Map.encode(opts)
  end
end
