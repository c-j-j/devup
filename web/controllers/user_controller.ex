defmodule Devup.UserController do
  use Devup.Web, :controller

  plug :authenticate when action in [:index]

  def new(conn, _params) do
    changeset = Devup.User.changeset(%Devup.User{})

    render conn, "new.html", changeset: changeset
  end

  def create(conn, %{"user" => user_params}) do
    changeset = Devup.User.registration_changeset(%Devup.User{}, user_params)
    case Devup.Repo.insert(changeset) do
      {:ok, user} ->
        conn
        |> Devup.Auth.login(user)
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

  def authenticate(conn, _opts) do
    if conn.assigns.current_user do
      conn
    else
      conn
      |> put_flash(:error, "You are not logged in.")
      |> redirect(to: page_path(conn, :index))
      |> halt()
    end
  end
end
