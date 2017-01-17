defmodule Calc do
  def calc(exp), do: _calc(exp, 0)

  defp _calc([n | tail], value) when n in ?0 ..?9 do
    _calc(tail, value * 10 + n - ?0)
  end

  defp _calc([op | tail], value) when op in '+*-/' do
    apply :erlang, list_to_atom([op]), [value, calc(tail)]
  end

  defp _calc([], value), do: value

  def eval(exp) do 
    {result, _} = Code.eval_string(exp)
    result
  end
end
