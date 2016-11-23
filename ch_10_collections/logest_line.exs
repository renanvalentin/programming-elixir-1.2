IO.puts File.read!("/usr/share/dict/words")
        |> String.split
        |> Enum.max_by(&String.length/1)

# slower
IO.puts File.stream!("/usr/share/dict/words") |> Enum.max_by(&String.length/1)

# faster
IO.puts File.open!("/usr/share/dict/words")
        |> IO.stream(:line)
        |> Enum.max_by(&String.length/1)
