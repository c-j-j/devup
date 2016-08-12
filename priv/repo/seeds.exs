alias Devup.Repo
alias Devup.Subject

linked_lists = Repo.insert!(%Subject{name: "Linked Lists", description: "These are linked lists"})
doubly_linked_lists = Repo.insert!(%Subject{name: "Doubly Linked Lists", description: "These are doubly linked lists"})
heaps = Repo.insert!(%Subject{name: "Heaps", description: "These are heaps"})
stacks = Repo.insert!(%Subject{name: "Stacks", description: "These are stacks"})
queues = Repo.insert!(%Subject{name: "Queues", description: "These are queues"})

linked_lists |> Ecto.build_assoc(:tasks, %{description: "Implement a linked list"}) |> Repo.insert!
linked_lists |> Ecto.build_assoc(:tasks, %{description: "Reverse a linked list"}) |> Repo.insert!
linked_lists |> Ecto.build_assoc(:tasks, %{description: "Find an element"}) |> Repo.insert!
linked_lists |> Ecto.build_assoc(:tasks, %{description: "Substitute the 4th element"}) |> Repo.insert!
