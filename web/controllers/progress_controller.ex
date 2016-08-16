defmodule Devup.ProgressController do
  use Devup.Web, :controller

  def update(conn, params) do
    IO.inspect(params)

    %{"subject_id" => subject_id} = params
    IO.inspect(subject_id)

    conn
    |> redirect(to: subject_path(conn, :show, subject_id))
  end
end
