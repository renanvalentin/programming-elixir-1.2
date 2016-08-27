defmodule Guard do
    def what_is(x) when is_number(x) do
        IO.puts "#{x} is a number"
    end

    def what_is(x) when is_list(x) do
        IO.puts "#{x} is a list"
    end

    def what_is(x) when is_atom(x) do
        IO.puts "#{x} is an atom"
    end

    def test(x) when x * 2 > 10 do
        IO.puts "daora!"
    end 

    def test(x) when div(x, 2) > 1 do
        IO.puts ":O"
    end
end
