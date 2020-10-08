defmodule HandlerWeb.PageController do
  use HandlerWeb, :controller

  def index(conn, _params) do
    events = Event.all() |> Event.compress()
    render(conn, "index.html", events: events)
  end

  def todo(conn, %{"name" => name, "deadline" => deadline}) do
    if name == "" or deadline == "" do
      events = Event.all() |> Event.compress()
      render(conn, "index.html", events: events)
    else
      str = Interface.Writer.construct_todo(name, deadline)

      with :ok <- Interface.Writer.command_todo(str) do
        # Interface.Reader.fetch()
        events = Event.all() |> Event.compress()
        render(conn, "index.html", events: events)
      else
        _ ->
          events = Event.all() |> Event.compress()
          render(conn, "index.html", events: events)
      end
    end
  end

  def note(conn, %{"name" => name}) do
    if name == "" do
      events = Event.all() |> Event.compress()
      render(conn, "index.html", events: events)
    else
      note = Interface.Writer.construct_note(name)
      with :ok <- Interface.Writer.command_note(note) do
        # Interface.Reader.fetch()
        events = Event.all() |> Event.compress()
        render(conn, "index.html", events: events)
      else
        _ ->
          events = Event.all() |> Event.compress()
          render(conn, "index.html", events: events)
      end
    end
  end
end
