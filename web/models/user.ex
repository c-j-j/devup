defmodule Devup.User do
  use Devup.Web, :model

  schema "users" do
    field :username, :string
    field :password, :string
    has_many :completed_tasks, Devup.CompletedTask

    timestamps
  end

  def changeset(model, params \\ :empty) do
    model
    |> cast(params, ~w(username password))
    |> validate_length(:username, min: 1, max: 30)
  end

  def registration_changeset(model, params) do
    model
    |> changeset(params)
    |> cast(params, ~w(password), [])
    |> validate_length(:password, min: 6)
    |> put_pass_hash()
  end

  defp put_pass_hash(changeset) do
    case changeset do
      %Ecto.Changeset{valid?: true, changes: %{password: password}} ->
        put_change(changeset, :password, Comeonin.Bcrypt.hashpwsalt(password))
      _ ->
        changeset
    end
  end
end
