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

  def start(_type, _args) do
    IO.puts "initializing"
    {:ok, _pid} = Sequence.Supervisor.start_link(123)
  end
end
