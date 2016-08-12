defmodule Devup.Task do
  use Devup.Web, :model

  schema "tasks" do
    field :description, :string
    belongs_to :subject, Devup.Subject

    timestamps
  end
end
