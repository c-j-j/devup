defmodule Devup.SubjectView do
  use Devup.Web, :view
  alias Devup.Subject

  def description(%Subject{description: description}) do
    description
  end
end
