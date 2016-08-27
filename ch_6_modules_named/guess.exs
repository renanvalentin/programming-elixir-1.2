defmodule Chop do
    def guess(actual, range) do
        guess = _pick(range)
       
         IO.puts "Is it #{guess}"
        _guess(actual, range, guess)
    end

    defp _pick(low..high), do: div(low + high,2)

    defp _guess(actual, _range, current) when current == actual do
        actual
    end

    defp _guess(actual, first.._last, current) when current > actual do
       guess(actual, first..(current - 1))   
    end 

    defp _guess(actual, _first..last, current) when current < actual do
        guess(actual, (current + 1)..last)
    end
end
