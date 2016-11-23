defmodule MyList do
  def flatten(list), do: _flatten(list, [])

  defp _flatten([], result), do: Enum.reverse(result)

  defp _flatten([[ h | []] | tail], result) do
    _flatten([h | tail], result)
  end

  defp _flatten([[h | t] | tail], result) do
    _flatten([h, t | tail], result)
  end

  defp _flatten([head | tail], result) do
    _flatten(tail, [head | result])
  end
end

IO.inspect MyList.flatten([1, [2, 3, [4], [5, [6, 7], 8]]])
