defmodule Devup.SessionController do
  use Devup.Web, :controller

  def new(conn, _) do
    render conn, "login.html"
  end

  def create(conn, %{"session" => %{"username" => username,
                                   "password" => password}}) do
    case Devup.Auth.login_with_credentials(conn, username, password, repo: Devup.Repo) do
      {:ok, conn} ->
        conn
        |> put_flash(:info, "Successful login")
        |> redirect(to: page_path(conn, :index))
      {:error, _reason, conn} ->
        conn
        |> put_flash(:error, "Sorry, the credentials you entered were wrong.")
        |> render("login.html")
    end
  end

  def delete(conn, _) do
    conn
    |> Devup.Auth.logout()
    |> redirect(to: page_path(conn, :index))
  end
end
