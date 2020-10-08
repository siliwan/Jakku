defmodule Interface.Writer do

  def construct_todo(name, deadline) do
    "\n* TODO #{name} \n DEADLINE: <#{deadline}>"
  end

  def construct_note(name) do
    "\n* NOTE #{name}"
  end


  def command_todo(str) do
    with {:ok, file} <- File.open("/home/jeykey/documents/supervisors/automatic.org", [:append]) do
      IO.binwrite(file, str)
    else
      _ -> :error
    end
  end

  def command_note(str) do
    with {:ok, file} <- File.open("/home/jeykey/documents/supervisors/notes.org", [:append]) do
      IO.binwrite(file, str)
    else
      _ -> :error
    end
  end

end
