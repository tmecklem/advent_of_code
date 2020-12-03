defmodule Star2 do
  def calculate_star2(filename) do
    [first, second, third] =
      filename
      |> read_integers_from_file()
      |> sum_2020()
    first * second * third
  end

  def sum_2020(list, partial_match \\ [])

  def sum_2020([], _), do: nil

  def sum_2020([head | tail], partial_match) when length(partial_match) < 2 do
    case sum_2020(tail, [head | partial_match]) do
      nil -> sum_2020(tail, partial_match)
      val -> val
    end
  end

  def sum_2020(list, partial_match) do
    Enum.find_value(list, fn(next_number) ->
      case Enum.sum([next_number | partial_match]) == 2020 do
        true -> Enum.reverse([next_number | partial_match])
        _ -> nil
      end
    end)
  end

  def read_integers_from_file(filename) do
    list =
      filename
      |> File.read!()
      |> String.split("\n")
      |> Enum.reduce([], fn(str, acc) ->
      str
      |> String.trim()
      |> Integer.parse()
      |> case do
           {integer, ""} -> [integer | acc]
           _ -> acc
         end
    end)
    |> Enum.reverse()
    |> sum_2020()
  end
end
