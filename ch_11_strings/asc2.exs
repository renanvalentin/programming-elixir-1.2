defmodule Asc2 do
  def printable?(char), do: Enum.all?(char, fn ch -> ch in ?\s ..?~ end) 
end

