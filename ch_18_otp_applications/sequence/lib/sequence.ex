defmodule Sequence do
  use Application

  @moduledoc """
  Documentation for Sequence.
  """

  @doc """
  Hello world.

  ## Examples

      iex> Sequence.hello
      :world

  """
  def hello do
    :world
  end

  def start(_type, initial_number) do
    IO.puts "initializing"
    {:ok, _pid} = Sequence.Supervisor.start_link(Application.get_env(:sequence, :initial_number))
  end
end
