defmodule Devup.Repo.Migrations.CreateSubject do
  use Ecto.Migration

  def change do
    create table(:subjects) do
      add :name, :string, null: false
      add :description, :string

      timestamps
    end
  end
end
