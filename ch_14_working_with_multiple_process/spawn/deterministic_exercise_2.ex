defmodule Spawn1 do
  def greet do
    receive do
      {sender, msg} ->
        send sender, { :ok, "Hello, #{msg}" }
    end
  end
end

# here's a client
pid_1 = spawn(Spawn1, :greet, [])
pid_2 = spawn(Spawn1, :greet, [])

send pid_1, {self, "Worladsfasfdasfdasfasfdasfadsfadfadsfadfadsfasd!"}
send pid_2, {self, "Kermit!"}

receive do
  {:ok, message} ->
    IO.puts message
end

receive do
  {:ok, message} ->
    IO.puts message
end
