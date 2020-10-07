defmodule EventTest do
  use ExUnit.Case

  test "Turns a simple csv string into %Event{} object." do
    str = "tasks, Sample task, upcoming-deadline, TODO, admin, 2020-10-6, ,In   3 d.:,C,-3,2020-10-6"
    assert Event.parse(str) == %{category: "tasks", name: "Sample task", todo: "TODO", tags: "admin", date: "2020-10-6", time: "", priority: "C", type: "upcoming-deadline"}
  end

  test "From full event to presentable fields" do
    event = %{category: "tasks", name: "Sample task", todo: "TODO", tags: "admin", date: "2020-10-6", time: "", priority: "C", type: "upcoming-deadline"}
    assert Event.merge_group([event]) == %Event{category: "tasks", name: "Sample task", todo: "TODO", tags: "admin", deadline: "2020-10-6", scheduled: "2020-10-6", priority: "A"}
  end
end
