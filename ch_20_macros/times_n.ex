defmodule Times do
    defmacro times_n(n) do
        quote do
            def unquote(:"times_#{n}")(x), do: unquote(n) * x
        end
    end
end

defmodule Test do
    require Times

    Times.time_n(3)
    Times.times_n(4)
end

IO.puts Test.times_3(4)
IO.puts Test.times_4(5)