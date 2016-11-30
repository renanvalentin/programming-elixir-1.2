defmodule Prime do
  def span(from, from), do: [from]
  def span(from, to) when from < to do
    [from | span(from + 1, to)]
  end

  def primes(n) do
    for num <- span(2, n), is_prime?(num), do: num
  end

  defp is_prime?(2), do: true
  defp is_prime?(num) do
    Enum.all?(span(2, num-1), &(rem(num, &1) != 0))
  end


  ## solutions from rebeca https://forums.pragprog.com/forums/322/topics/11937
end
