defmodule Aoc2021 do
  @moduledoc """
  Documentation for `Aoc2021`.
  """

  def prepare_input(path) do
    File.read!(path)
    |> String.split("\n", trim: true)
  end
end
