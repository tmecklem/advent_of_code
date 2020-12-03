defmodule Star3Test do
  use ExUnit.Case

  test "computes valid passwords correctly" do
    validation_record = %{range: (1..3), char: "a", password: "abcde"}
    assert Star3.validate_password(validation_record)
  end

  test "computes invalid passwords correctly" do
    validation_record = %{range: (1..3), char: "a", password: "cdefg"}
    refute Star3.validate_password(validation_record)
  end

  test "validates lists of password correctly" do
    validation_records = [
      %{range: (1..3), char: "a", password: "abcde"},
      %{range: (1..3), char: "a", password: "cdefg"}
    ]

    assert Star3.validate_passwords(validation_records) == 1
  end

  test "validates lists of password from file correctly" do
    assert Star3.validate_passwords_from_file(Path.join([File.cwd!(), "test", "star3_test_file.txt"])) == 2
  end
end
