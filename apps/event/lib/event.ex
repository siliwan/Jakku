defmodule Event do
  @moduledoc """
  Documentation for `Event`.
  """

  # Split between scheduled and deadline

  # defstruct category: "", name: "", type: "", todo: "", tags: "", date: "", time: "", priority: ""

  defstruct category: "", name: "", todo: "", tags: "", priority: ""

  def all() do
    File.read!("/home/jeykey/todos.csv")
    |> String.trim()
    |> String.split("\n")
    |> Enum.map(&parse(&1))
  end

  def compress(list) do
    list
    |> Enum.group_by(& &1.name)
    |> Enum.map(&(elem(&1, 1) |> merge_group()))
  end

  # date: Enum.map(events, & dates ++ &1.date) |> Enum.max
  def merge_group(events) do
    %Event{
      name: Enum.at(events, 0).name,
      category: Enum.at(events, 0).category,
      tags: Enum.at(events, 0).tags,
      todo: Enum.at(events, 0).todo,
      priority: Enum.at(events, 0).priority
    }
  end

  @doc """
  Turns a csv formatted event string into the %Event{} stuct.
  """
  def parse(event) do
    mapped = get_map(event)

    if mapped == nil do
      {:error, nil}
    end

    # Is save because of the nil handler above.
    %{
      category: Map.fetch!(mapped, "category"),
      name: Map.fetch!(mapped, "name"),
      type: Map.fetch!(mapped, "type"),
      todo: Map.fetch!(mapped, "todo"),
      tags: Map.fetch!(mapped, "tags"),
      priority: Map.fetch!(mapped, "priority_l")
    }
  end

  @doc """
  Creates a map from the csv returned by emacs.
  """
  def get_map(event) do
    names = [
      "category",
      "name",
      "type",
      "todo",
      "tags",
      "date",
      "time",
      "extra",
      "priority_l",
      "priority_n",
      "timestamp"
    ]

    parts = String.split(event, ",") |> Enum.map(&String.trim(&1))
    # If there is no timestamp, the last element won't be there. So just add an empty ","
    if length(names) > length(parts) do
      parse(event <> ",")
    end

    Enum.zip(names, parts) |> Enum.into(%{})
  end
end
