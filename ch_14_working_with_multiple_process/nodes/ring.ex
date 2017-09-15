defmodule Ring do
  
  @interval 2000  # 2 seconds
  @name     :ticker

  def start do
    pid = spawn(__MODULE__, :loop, [[]])
    :global.register_name(@name, pid)
  end

  def add_client do
    pid = spawn(__MODULE__, :receiver, [])
    register(pid)
  end

  def register(client_pid) do
    send :global.whereis_name(@name), { :register, client_pid }
  end

  def loop(queue \\ []) do
    receive do
      { :register, pid } ->
        IO.puts "registering #{inspect pid}"
        loop(queue ++ [pid])
    after
      @interval ->
        #IO.puts "tick"
        tick(queue)
    end
  end

  defp tick([]), do: loop

  defp tick([next_client | queue]) do
    send next_client, {:tick, queue ++ [next_client]}
    receiver 
  end

  def receiver do
    receive do
      { :tick, queue } ->
        IO.puts "tock in client"
        loop(queue) 
    end
  end
end
