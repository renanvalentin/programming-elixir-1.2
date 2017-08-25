# inspired by Patrick Oscity's solution
# Stefan Chrobot has another clever idea iex> h exit
defmodule Ex3 do
  import :timer, only: [ sleep: 1 ]

  def messenger(recipient) do
    send recipient, { :ok, "Ao" }
    raise RuntimeError, message: "Holy Cow!"
  end 

  def receive_messages do
    receive do
      message ->
        IO.puts "result: #{inspect message}"
        receive_messages
    after 500 ->
      IO.puts "ending..."
    end
  end

  def run do
    spawn_link(Ex3, :messenger, [self])
    sleep 500
    receive_messages
  end
end

Ex3.run
