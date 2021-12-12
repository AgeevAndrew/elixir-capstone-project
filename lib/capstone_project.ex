defmodule CapstoneProject do
  @moduledoc """
  Documentation for `CapstoneProject`.
  """

  def words_count(file_name \\ "files/words.txt") do
    File.stream!(file_name)
      |> Stream.map(&String.trim(&1) |> String.split(~r/\s+/) |> length())
      |> Enum.reduce(0, fn x, acc -> x + acc end)
  end
end
