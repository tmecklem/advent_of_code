defmodule Star3 do
  def validate_passwords_from_file(filename) do
    filename
    |> parse_password_file()
    |> validate_passwords()
  end

  def validate_passwords(password_validations) do
    Enum.count(password_validations, &validate_password/1)
  end

  def validate_password(record = %{range: range, char: char, password: password}) do
    Enum.member?(range, Enum.count(String.graphemes(password), fn(password_char) -> char == password_char end))
  end

  defp parse_password_file(filename) do
    ~r/^(\d+)-(\d+) (\S): (\S+)$/m
    |> Regex.scan(File.read!(filename))
    |> Enum.map(fn(caps) ->
      range = Range.new(String.to_integer(Enum.at(caps, 1)), String.to_integer(Enum.at(caps, 2)))
      %{ range: range, char: Enum.at(caps, 3), password: Enum.at(caps, 4)}
    end)
  end
end



