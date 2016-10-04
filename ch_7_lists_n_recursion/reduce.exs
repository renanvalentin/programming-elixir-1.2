defmodule MyList do
  def reduce([], value, _) do
    value
  end

  def reduce([head | tail], value, func) do
    reduce(tail, func.(head, value), func)
  end

  def mapsum(list, func) do
    reduce(_mapsum(list, func), 0, &(&1 + &2))
  end

  defp _mapsum([], _func), do: []
  defp _mapsum([head | tail], func) do
    [func.(head) | _mapsum(tail, func)]
  end

  def max([]), do: 0
  def max([head | tail]) do
    curr = max(tail)
    if head > curr, do: head, else: curr
  end

  def caeser([], n), do: []
  def caeser([head | tail], n) do
    if head + n < ?z, do: [head + n | caeser(tail, n)], else: [(?a + n - (?z - head)) - 1 | caeser(tail, n)]
  end
end
