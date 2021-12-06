defmodule CapstoneProject do
  @moduledoc """
  Documentation for `CapstoneProject`.
  """

  def words_count(file_name \\ "files/words.txt") do
    File.read!(file_name) |> String.split(~r/\s+/) |> length()
  end
end
