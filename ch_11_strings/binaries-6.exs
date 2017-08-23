defmodule MyString do
  def capitalize_sentences(string, starting\\true)
  def capitalize_sentences(<< ".", " ", tail::binary >>, _starting) do
    ". " <> capitalize_sentences(tail, true)
  end
  def capitalize_sentences(<< head::utf8, tail::binary >>, true) do
    String.upcase(<< head >>) <> capitalize_sentences(tail, false)
  end
  def capitalize_sentences(<< head::utf8, tail::binary >>, false) do
    String.downcase(<< head >>) <> capitalize_sentences(tail, false)
  end
  def capitalize_sentences(empty=<< >>, _starting), do: empty
end
