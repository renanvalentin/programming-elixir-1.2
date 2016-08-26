defmodule Arithmetic do
    def sum(0), do: 1
    def sum(n), do: 1 + sum(n-1)
    def gcd(x,0), do: x
    def gcd(x,y), do: gcd(y, rem(x,y))
end
