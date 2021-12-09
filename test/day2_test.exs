defmodule Day2Test do
  use ExUnit.Case

  @measures """
forward 5
down 5
forward 8
up 3
down 8
forward 2
""" |> String.split("\n", trim: true)

  test "navigate" do
    assert Day2.navigate(@measures) == 150
  end

  test "navigate_with_aim" do
    assert Day2.navigate_with_aim(@measures) == 900
  end
end

