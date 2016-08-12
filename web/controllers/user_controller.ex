defmodule Devup.UserController do
  use Devup.Web, :controller

  def new(conn, _params) do
    changeset = Devup.User.changeset(%Devup.User{})

    render conn, "new.html", changeset: changeset
  end

  def create(conn, %{"user" => user_params}) do
    IO.inspect(user_params)
    changeset = Devup.User.changeset(%Devup.User{}, user_params)
    case Devup.Repo.insert(changeset) do
      {:ok, user} ->
        conn
        |> put_flash(:info, "#{user.username} was successfully created.")
        |> redirect(to: user_path(conn, :index))
      {:error, changeset} ->
        render(conn, "new.html", changeset: changeset)
    end

    conn
    |> redirect(to: user_path(conn, :index))
  end

  def index(conn, params) do
    users = Devup.Repo.all(Devup.User)

    render conn, "index.html", users: users
  end
end
