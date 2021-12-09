defmodule Day2Test do
  use ExUnit.Case

  @measures """
00100
11110
10110
10111
10101
01111
00111
11100
10000
11001
00010
01010
""" |> String.split("\n", trim: true)

  test "power_consumption" do
    assert Day3.power_consumption(@measures) == 198
  end

  test "life_supporting_rating" do
    assert Day3.life_supporting_rating(@measures) == 230
  end
end

