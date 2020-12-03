defmodule Star1 do
  def calculate_star1(filename) do
    [first, second] =
      filename
      |> read_integers_from_file()
      |> sum_2020()
    first * second
  end

  def sum_2020([first_number | rest]) do
    case Enum.find(rest, fn(second_number) -> 2020 - first_number == second_number end) do
      nil -> sum_2020(rest)
      second_number -> [first_number, second_number]
    end
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
