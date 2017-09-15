defmodule CatFinder do
  def cat(scheduler) do
    send scheduler, { :ready, self }

    receive do
      { :cat, file, client } ->
        send client, { :answer, file, cat_finder(file), self }
      { :shutdown } ->
        exit(:normal)
    end
  end

  defp cat_finder({:ok, regex}, file), do: Regex.scan(regex, File.read!(file)) |> length            
  defp cat_finder({:error, _reason}, _file), do: 0
  defp cat_finder(file), do: cat_finder(Regex.compile("cat"), file)
end

defmodule Scheduler do
  def run(module, func, file) do
      pid = spawn(module, func, [self])
      schedule_processes(pid, file) 
  end

  defp schedule_processes(pid, file) do
    receive do
      {:ready, ^pid} ->
        send pid, {:cat, file, self}

      {:answer, _file, result, pid} ->
        send pid, {:shutdown}
        [result]
    end
  end
end

to_process = './'
files = File.ls!(to_process)
number_of_files = length files

Enum.each files, fn file ->
  {time, result} = :timer.tc(
    Scheduler, :run,
    [CatFinder, :cat, file]
  )

  IO.inspect result
  #  :io.format "~2B          ~.2f~n", [number_of_files, time/1000000.0]
end

