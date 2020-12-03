defmodule Star2Test do
  use ExUnit.Case

  test "calculates sum to 2020 correctly" do
    values = [1721, 979, 366, 299, 675, 1456]
    assert Star2.sum_2020(values) == [979, 366, 675]
  end

  test "calculates multiplication 2020 correctly by reading from a file" do
    assert Star2.calculate_star2(Path.join([File.cwd!(), "test", "star1_test_file.txt"])) == 241861950
  end
end
