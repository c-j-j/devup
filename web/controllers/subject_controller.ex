defmodule Devup.SubjectController do
  use Devup.Web, :controller

  def index(conn, _params) do
    subjects = Repo.all(Devup.Subject)
    render conn, "index.html", subjects: subjects
  end

  def show(conn, %{"id" => id}) do
    subject = Devup.Subject
      |> Repo.get(id)
      |> Repo.preload(:tasks)

    IO.inspect(subject.tasks)

    render conn, "show.html", subject: subject
  end

  def fetch_subject(id) do
    Devup.Subject
    |> Repo.get(id)
    |> Repo.preload(:tasks)
  end
end
