defmodule CapstoneProject do
  @moduledoc """
  Documentation for `CapstoneProject`.
  """

  def words_count(file_name \\ "files/words.txt") do
    File.stream!(file_name)
      |> Stream.scan(0, fn string, acc -> acc + (String.trim(string) |> String.split(~r/\s+/) |> length()) end)
      |> Enum.at(-1)
  end
end
