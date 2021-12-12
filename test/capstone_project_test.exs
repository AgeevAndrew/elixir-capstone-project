defmodule CapstoneProjectTest do
  use ExUnit.Case
  doctest CapstoneProject

  test "greets the world" do
    assert CapstoneProject.words_count() == 3424512
  end
end
