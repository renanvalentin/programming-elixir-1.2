# Solution by Dmitry Nesteryuk
defmodule Anagram do
  def anagram?(word1, word2) do
      word_vector(word1) == word_vector(word2)
  end

  defp word_vector(word) do
    :math.sqrt(word_distance(word))
  end  

  defp word_distance([letter | tail ]) do
    letter * letter + word_distance(tail)
  end

  defp word_distance([]), do: 0
end
