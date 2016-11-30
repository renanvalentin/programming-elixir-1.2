defmodule MyList do
  def len([]), do: 0
  def len([_head|tail]), do: 1 + len(tail)
  
  def square([]), do: []
  def square([head | tail]), do: [head * head | square(tail)]

  def add_1([]), do: []
  def add_1([head | tail]), do: [head + 1 | add_1(tail)]

  def map([], _func), do: []
  def map([head | tail], func), do: [func.(head) | map(tail, func)]

  def sum(list), do: _sum(list, 0)

  def summy([]), do: 0
  def summy([head | tail]), do: head + summy(tail) 

  # private methods
  def _sum([], total), do: total
  def _sum([head | tail], total), do: _sum(tail, head + total)
end