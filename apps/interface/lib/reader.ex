defmodule Interface.Reader do
  @moduledoc """
  Responsible for reading the TODOs from emacs.
  """

  def command() do
    path = Application.get_env(:interface, :path, "~/.emacs")
    time = Application.get_env(:interface, :time, "month")
    letter = Application.get_env(:interface, :letter, "a")

    eval = "'(org-batch-agenda-csv \"#{letter}\" org-agenda-span (quote #{time}))'"

    #System.cmd("emacs", ["-batch", "-l", path, "-eval", eval, ">>", "current.csv"])
    System.cmd("emacs", ["-batch", "-l", path, "-eval", eval])
  end

  def fetch() do
    System.cmd("./extract.sh", [])
  end
end
