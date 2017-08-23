defmodule Alignement do
  def center(words) do
    longest = longest_width(words, 0)
    print(words, longest, [])
  end

  defp add_pad([], _, acc), do: Enum.reverse acc

  defp add_pad([head | tail], longest, acc) do 
    hl = longest - String.length(head)
    pad_left = String.duplicate(" ", div(hl, 2))
    pad_right = String.duplicate(" ", rem(hl, 2)) <> pad_left

    print(tail, longest, [pad_left <> head <> pad_right | acc]) 
  end

  defp longest_width([], longest), do: longest

  defp longest_width([head | tail], longest) when byte_size(head) > longest do
    longest_width(tail, String.length(head))
  end

  defp longest_width([head | tail], longest) do
    longest_width(tail, longest)
  end
end
