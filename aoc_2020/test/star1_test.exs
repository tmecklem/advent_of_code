defmodule Star1Test do
  use ExUnit.Case

  test "calculates sum to 2020 correctly" do
    values = [1721, 979, 366, 299, 675, 1456]
    assert Star1.sum_2020(values) == [1721, 299]
  end

  test "calculates multiplication 2020 correctly by reading from a file" do
    assert Star1.calculate_star1(Path.join([File.cwd!(), "test", "star1_test_file.txt"])) == 514579
  end
end
