defmodule Devup.ProgressControllerTest do
  alias Devup.Repo
  alias Devup.Subject
  use Devup.ConnCase

  setup do
    user = insert_user(username: "Max")
    conn = assign(conn(), :current_user, user)

    {:ok, conn: conn, user: user}
  end

  test "updating progress redirects back to subject", %{conn: conn} do
    subject = Repo.insert!(%Subject{name: "name", description: "description"})

    conn = conn
    |> assign(:current_user, "Foo")
    |> post("/progress", %{"task_id" => "1", "subject_id" => subject.id})

    assert redirected_to(conn) == subject_path(conn, :show, subject.id)
  end

  def insert_user(attrs) do

  end
end
