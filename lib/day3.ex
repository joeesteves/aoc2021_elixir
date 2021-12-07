defmodule Day3 do
  def power_consumption(measures) do
    gama(measures) * epsilon(measures)
  end

  def zip_measures(measures) do
    measures
    |> Enum.map(&String.graphemes/1)
    |> Enum.zip()
    |> Enum.map(&Tuple.to_list/1)
  end

  def gama(measures) do
    measures
    |> zip_measures
    |> Enum.map(&most_repeated/1)
    |> Enum.join()
    |> :erlang.binary_to_integer(2)
  end

  def epsilon(measures) do
    measures
    |> zip_measures
    |> Enum.map(&least_repeated/1)
    |> Enum.join()
    |> :erlang.binary_to_integer(2)
  end

  def most_repeated(list) do
    list
    |> Enum.frequencies()
    |> Enum.sort(:desc)
    |> Enum.max_by(fn {_k, v} -> v end)
    |> then(&elem(&1, 0))
  end

  def least_repeated(list) do
    list
    |> Enum.frequencies()
    |> Enum.sort()
    |> Enum.min_by(fn {_k, v} -> v end)
    |> then(&elem(&1, 0))
  end

  def oxygen(measures) do
  end
end
