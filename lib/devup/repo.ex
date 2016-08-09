defmodule Devup.Repo do
  # use Ecto.Repo, otp_app: :hello_phoenix

  def all(Devup.Item) do
    [
      %Devup.Item{id: "1", description: "Linked Lists"},
      %Devup.Item{id: "2", description: "Doubly Linked Lists"},
      %Devup.Item{id: "3", description: "Heap"},
      %Devup.Item{id: "4", description: "Stack"},
      %Devup.Item{id: "4", description: "Queue"},
    ]
  end

  def get(module, id) do
    Enum.find(all(module), fn element -> element.id == id end)
  end

  def all(_module), do: []
end
