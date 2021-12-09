defmodule Day1Test do
  use ExUnit.Case

  @measures [199, 200, 208, 210, 200, 207, 240,  269, 260, 263]

  test "count increases" do
    assert Day1.count_increases(@measures) == 7
  end

  test "count sum increases" do
    assert Day1.group_measures(@measures) |> Day1.count_increases == 5
  end
end

