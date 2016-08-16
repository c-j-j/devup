defmodule Devup.CompletedTask do
  use Devup.Web, :model

  schema "completed_tasks" do
    belongs_to :user, Devup.User
    belongs_to :task, Devup.Task

    timestamps
  end
end
