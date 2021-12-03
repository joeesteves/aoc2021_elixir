defmodule Day1 do
  def count_increases(measures, prev_number \\ nil , increases_count \\ 0)
  def count_increases([head | tail], nil, _increases_count) do
    count_increases(tail, head, 0)
  end

  def count_increases([], _prev_number, increases_count), do: increases_count

  def count_increases([head | tail], prev_number, increases_count) do
    if head > prev_number do
      count_increases(tail, head, increases_count + 1)
    else
      count_increases(tail, head, increases_count)
    end
  end

  def group_measures(measures) do
    [measures, [ 0 | measures], [ 0, 0 | measures]]
    |> Enum.zip_with(fn [x,y,z] -> x + y + z end)
    |> Enum.drop(2)
  end
end
