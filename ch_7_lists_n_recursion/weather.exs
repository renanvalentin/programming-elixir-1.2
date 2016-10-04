defmodule WeatherHistory do
  def for_location27([]), do: []
  def for_location27([[time, 27, temp, rain] | tail]) do
    [[time, 27, temp, rain] | for_location27(tail)]
  end
  def for_location27([_ | tail]), do: for_location27(tail)

  def for_location([], _target_loc), do: []

  def for_location([ head = [_, _, target_loc, _] | tail], target_loc) do
    [head | for_location(tail, target_loc)]
  end

  def for_location([ _ | tail ], target_loc), do: for_location(tail, target_loc)
  
  def test_data do
    [
      [1366225622, 26, 12, 0.125],
      [1366225622, 27, 15, 0.425],
      [1366225622, 23, 14, 0.625],
      [1366225622, 27, 13, 0.225],
    ]
  end
end
