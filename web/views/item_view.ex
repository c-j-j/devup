defmodule Devup.ItemView do
  use Devup.Web, :view
  alias Devup.Item

  def description(%Item{description: description}) do
    description
  end
end
