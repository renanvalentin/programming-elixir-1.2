defmodule MyList do
  def filter([], _func), do: []
  def filter([head | tail], func) do
    if func.(head) do
     [head] ++  filter(tail, func)
    else
      filter(tail, func)
    end
  end

  def tail_filter([], _), do: []
  def tail_filter(list, fun), do: _tail_filter(list, [], fun)

  defp _tail_filter([], res, _), do: Enum.reverse res
  defp _tail_filter([head | tail], res, fun) do
    if fun.(head) do
      _tail_filter(tail, [head | res], fun)
    else 
      _tail_filter(tail, res, fun)
    end
  end

  def all?(list, fun), do: _all?(list, fun, true)

  defp _all?([], _, true), do: true 
  defp _all?(_, _, false), do: false
  defp _all?([head | tail], fun, true) do
    _all?(tail, fun, fun.(head))
  end

  def split(list, count), do: _split(list, count, [])

  defp _split([head | tail], count, acc) when count > 0 do 
    _split(tail, count - 1, [head] ++ acc)
  end

  defp _split(list, _, acc), do: {Enum.reverse(acc), list}
end
