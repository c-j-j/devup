defmodule Devup.Repo.Migrations.CreateCompletedTasks do
  use Ecto.Migration

  def change do
    create table(:completed_tasks) do
      add :user_id, references(:users, on_delete: :delete_all)
      add :task_id, references(:tasks, on_delete: :delete_all)
    end
  end
end
