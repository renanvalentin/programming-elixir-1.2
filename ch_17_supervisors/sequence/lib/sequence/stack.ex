defmodule Sequence.Stack do
  use GenServer

  #####
  # External API
  
  def start_link(current_stack \\ []) do
    GenServer.start_link(__MODULE__, current_stack, name: __MODULE__)
  end

  def pop do
    GenServer.call __MODULE__, :pop
  end

  def push(item) do
    GenServer.cast __MODULE__, {:push, item}
  end

  def terminate do
    GenServer.terminate __MODULE__, {:terminate}
  end

  def handle_call(:pop, _from, []), do: raise "Empty Stack"

  def handle_call(:pop, _from, [head | tail]) do
    { :reply, head, tail }
  end

  def handle_cast({:push,  next_value}, current_stack) when next_value < 10 do
    { :stop, "Number less than 10 are not allowed", current_stack }
  end

  def handle_cast({:push, next_value}, current_stack) do
    { :noreply, [next_value | current_stack] }
  end

  def terminate(reason, state) do
    IO.puts "Being terminate due to #{reason}"
    IO.puts "Last state: #{inspect state}"
    :ok
  end
end
