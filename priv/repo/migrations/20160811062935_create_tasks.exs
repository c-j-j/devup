defmodule Devup.Repo.Migrations.CreateTasks do
  use Ecto.Migration

  def change do
    create table(:tasks) do
      add :description, :string
      add :subject_id, references(:subjects, on_delete: :delete_all)

      timestamps
    end

    create index(:tasks, [:subject_id])
  end
end
