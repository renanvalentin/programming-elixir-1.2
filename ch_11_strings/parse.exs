defmodule Parse do
  def number([ ?-  | tail ]), do: _number_digits(tail, 0) * -1
  def number([ ?+  | tail ]), do: _number_digits(tail, 0)
  def number(str),            do: _number_digits(str, 0)

  defp _number_digits([], value), do: value
  defp _number_digits([ digit | tail ], value)
  when digit in '0123456789' do
    IO.puts "value: #{value}"
    IO.puts "sum: #{value * 10 + digit - ?0}"
    _number_digits(tail, value * 10 + digit - ?0)
  end
  defp _number_digits([ non_digit | _ ], _) do
    raise "Invalid digit '#{[non_digit]}'"
  end
end
