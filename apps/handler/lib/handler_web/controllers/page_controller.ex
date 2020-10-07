defmodule HandlerWeb.PageController do
  use HandlerWeb, :controller

  def index(conn, _params) do
    events = Event.all() |> Event.compress()
    render(conn, "index.html", events: events)
  end
end
