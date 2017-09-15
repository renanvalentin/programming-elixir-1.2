defmodule Ticker do
  
  @interval 2000  # 2 seconds
  @name     :ticker

  def start do
    pid = spawn(__MODULE__, :generator, [[]])
    :global.register_name(@name, pid)
  end

  def register(client_pid) do
    send :global.whereis_name(@name), { :register, client_pid }
  end

  def generator(clients, waiting_clients \\ []) do
    receive do
      { :register, pid } ->
        IO.puts "registering #{inspect pid}"
        generator([pid | clients], waiting_clients)
    after
      @interval ->
        IO.puts "tick"
        
        waiting_clients = tick(clients, waiting_clients)
        generator(clients, waiting_clients)
    end
  end

  defp tick([], []), do: []

  defp tick(clients, []), do: tick(clients, clients)

  defp tick(clients, [next_client | waiting_clients]) do
    send next_client, {:tick}
    waiting_clients
  end
end

defmodule Client do

  def start do
    pid = spawn(__MODULE__, :receiver, [])
    Ticker.register(pid)
  end

  def receiver do
    receive do
      { :tick } ->
        IO.puts "tock in client"
        receiver
    end
  end
end
