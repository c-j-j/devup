defmodule Devup.ItemController do
  use Devup.Web, :controller

  def index(conn, _params) do
    items = Repo.all(Devup.Item)
    render conn, "index.html", items: items
  end

  def show(conn, %{"id" => id}) do
    item = Repo.get(Devup.Item, id)
    render conn, "show.html", item: item
  end
end
