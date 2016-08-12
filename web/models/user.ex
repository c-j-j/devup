defmodule Devup.User do
  use Devup.Web, :model

  schema "users" do
    field :username, :string
    field :password, :string

    timestamps
  end

  def changeset(model, params \\ :empty) do
    model
    |> cast(params, ~w(username password))
    |> validate_length(:username, min: 1, max: 30)
    |> validate_length(:password, min: 1)
  end
end
