defmodule Devup.Subject do
  use Devup.Web, :model

  schema "subjects" do
    field :name, :string
    field :description, :string
    has_many :tasks, Devup.Task

    timestamps
  end
end

