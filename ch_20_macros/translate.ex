# inspired by https://forums.pragprog.com/forums/322/topics/11982
defmodule Arithmetic do
    defmacro explain(expression) do
        do_clause = Keyword.get(expression, :do, nil)
        
        parse(quote do
            unquote(do_clause)
        end)
    end

    ## Inputs sample
    ## {:+, [line: 17], [2, {:*, [line: 17], [3, 4]}]}
    ## {:+, [line: 18], [2, 3]}
    ## {:*, [line: 19], [{:+, [line: 19], [2, 3]}, 4]}
    ## {:/, [line: 20], [{:+, [line: 20], [2, 3]}, {:+, [line: 20], [4, 3]}]}
    defp parse({operator, _, [left, right]}) 
    when (is_number left) and (is_number right)
    do
    
        "#{translate(operator)} #{left} and #{right}"
    end

    defp parse({operator, _, [left, right]}) 
    when (is_number left) and (is_tuple right)
    do
        "#{parse(right)}, then #{translate(operator, 2)} #{left}"
    end

    defp parse({operator, _, [left, right]}) 
    when (is_tuple left) and (is_number right)
    do
        "#{parse(left)}, then #{translate(operator)} #{right}"
    end

    defp parse({operator, _, [left, right]}) do
        "#{parse(left)} and #{parse(right)}, then #{translate(operator)}"
    end

    @operators [{:+, "add" },
                {:+, " to"},
                {:-, "substract"},
                {:-, " from"},
                {:*, "multiply"},
                {:*, " by"},
                {:/, "divide"},
                {:/, " by"}
    ]        

  def translate(operator, appendix \\ 1)
  def translate(operator, appendix) when appendix == 2 do
    @operators |> Keyword.take([operator]) |> Keyword.values |> List.to_string
  end

  def translate(operator, _appendix) do
    {:ok, word} = Keyword.fetch(@operators, operator)
    word
  end
end

defmodule NaturalLanguage do
    require Arithmetic

    #IO.puts Arithmetic.explain do: 2+3*4
    #IO.puts Arithmetic.explain do: 2 + 3
    IO.puts Arithmetic.explain do: (2 + 3) * 4
    #IO.puts Arithmetic.explain do: (2 + 3) / (4 + 3)
    
end