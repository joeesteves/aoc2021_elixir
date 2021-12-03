defmodule Aoc2021 do
  @moduledoc """
  Documentation for `Aoc2021`.
  """

  def prepare_input(path) do
    File.read!(path)
    |> String.split("\n")
    |> Enum.reject(&( &1 in ["", nil]))
    |> Enum.map(&String.to_integer/1)
  end
end
