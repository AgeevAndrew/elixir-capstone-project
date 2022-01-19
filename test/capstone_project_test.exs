defmodule CapstoneProjectTest do
  use ExUnit.Case
  doctest CapstoneProject

  describe "add" do
    test "sum two positive rational numbers" do
      r1 = {1, 2}
      r2 = {3, 4}

      assert CapstoneProject.add(r1, r2) == {5, 4}
    end

    test "sum positive rational number with negative rational number" do
      r1 = {1, 2}
      r2 = {-5, 8}

      assert CapstoneProject.add(r1, r2) == {-1, 8}
    end

    test "sum two negative rational numbers" do
      r1 = {-1, 2}
      r2 = {-3, 8}

      assert CapstoneProject.add(r1, r2) == {-7, 8}
    end

    test "sum the same rational numbers with opposite signs" do
      r1 = {3, 8}
      r2 = {-3, 8}

      assert CapstoneProject.add(r1, r2) == {0, 1}
    end
  end

  describe "subtract" do
    test "subtract two positive rational numbers" do
      r1 = {1, 2}
      r2 = {2, 3}

      assert CapstoneProject.subtract(r1, r2) == {-1, 6}
    end

    test "subtract a positive rational number and a negative rational number" do
      r1 = {1, 2}
      r2 = {-1, 4}

      assert CapstoneProject.subtract(r1, r2) == {3, 4}
    end

    test "subtract two negative rational numbers" do
      r1 = {-1, 2}
      r2 = {-2, 3}

      assert CapstoneProject.subtract(r1, r2) == {1, 6}
    end

    test "subtract a rational number from itself" do
      r1 = {-1, 2}
      r2 = {-1, 2}

      assert CapstoneProject.subtract(r1, r2) == {0, 1}
    end
  end

  describe "multiply" do
    test "Multiply two positive rational numbers" do
      r1 = {1, 3}
      r2 = {4, 5}

      assert CapstoneProject.multiply(r1, r2) == {4, 15}
    end

    test "Multiply a positive number by a negative number" do
      r1 = {1, 2}
      r2 = {-7, 6}

      assert CapstoneProject.multiply(r1, r2) == {-7, 12}
    end

    test "Multiply a rational number by its reciprocal" do
      r1 = {1, 2}
      r2 = {2, 1}

      assert CapstoneProject.multiply(r1, r2) == {1, 1}
    end

    test "Multiply a rational number by zero" do
      r1 = {1, 2}
      r2 = {0, 1}

      assert CapstoneProject.multiply(r1, r2) == {0, 1}
    end
  end

  describe "divide_by" do
    test "Divide two positive rational numbers" do
      r1 = {1, 2}
      r2 = {2, 3}

      assert CapstoneProject.divide_by(r1, r2) == {3, 4}
    end

    test "Divide a positive number by a negative number" do
      r1 = {3, 4}
      r2 = {-2, 5}

      assert CapstoneProject.divide_by(r1, r2) == {-15, 8}
    end

    test "Divide two negative rational numbers" do
      r1 = {-3, 4}
      r2 = {-2, 5}

      assert CapstoneProject.divide_by(r1, r2) == {15, 8}
    end

    test "Divide a negative ratinal number by 1" do
      r1 = {-3, 4}
      r2 = {1, 1}

      assert CapstoneProject.divide_by(r1, r2) == {-3, 4}
    end
  end

  describe "abs" do
    test "Absolute value of a positive rational number" do
      r = {7, 8}

      assert CapstoneProject.abs(r) == {7, 8}
    end

    test "Absolute value of a negative rational number" do
      r = {-7, 8}

      assert CapstoneProject.abs(r) == {7, 8}
    end

    test "Absolute value of a negative number with a negative denominator" do
      r = {7, -8}

      assert CapstoneProject.abs(r) == {7, 8}
    end

    test "Absolute value of a positive number with negative numerator and denominator" do
      r = {-7, -8}

      assert CapstoneProject.abs(r) == {7, 8}
    end
  end

  describe "pow_rational" do
    test "increase a positive rational number to a positive int power" do
      r = {2, 3}
      n = 3

      assert CapstoneProject.pow_rational(r, n) == {8, 27}
    end

    test "increase a negative rational number to a positive int power" do
      r = {-2, 3}
      n = 3

      assert CapstoneProject.pow_rational(r, n) == {-8, 27}
    end

    test "increase zero to a positive int power" do
      r = {0, 1}
      n = 3

      assert CapstoneProject.pow_rational(r, n) == {0, 1}
    end

    test "increase one to a positive int power" do
      r = {1, 1}
      n = 3

      assert CapstoneProject.pow_rational(r, n) == {1, 1}
    end

    test "increase positive rational number to zero power" do
      r = {4, 5}
      n = 0

      assert CapstoneProject.pow_rational(r, n) == {1, 1}
    end

    test "increase negative rational number to zero power" do
      r = {-4, 5}
      n = 0

      assert CapstoneProject.pow_rational(r, n) == {1, 1}
    end
  end

  describe "Exponentiation of a real number to a rational number" do
    test "Increase a real number to a positive rational number" do
      n = 8
      r = {4, 3}

      assert_in_delta CapstoneProject.pow_real(n, r), 16.0, 1.0e-10
    end

    test "Raise a real number to a negative rational number" do
      n = 9
      r = {-1, 2}

      assert_in_delta CapstoneProject.pow_real(n, r), 0.3333333333, 1.0e-10
    end

    test "Raise a real number to a zero rational number" do
      n = 2
      r = {0, 1}

      assert_in_delta CapstoneProject.pow_real(n, r), 1.0, 1.0e-10
    end
  end

  describe "Reduction to lowest terms" do
    test "Reduce a positive rational number to lowest terms" do
      r = {2, 8}

      assert CapstoneProject.reduce(r) == {1, 4}
    end

    test "Reduce places the minus sign on the numerator" do
      r = {3, -4}

      assert CapstoneProject.reduce(r) == {-3, 4}
    end

    test "Reduce a negative rational number to lowest terms" do
      r = {-4, 6}

      assert CapstoneProject.reduce(r) == {-2, 3}
    end

    test "Reduce a rational number with a negative denominator to lowest terms" do
      r = {3, -9}

      assert CapstoneProject.reduce(r) == {-1, 3}
    end

    test "Reduce zero to lowest terms" do
      r = {0, 6}

      assert CapstoneProject.reduce(r) == {0, 1}
    end

    test "Reduce an integer to lowest terms" do
      r = {-14, 7}

      assert CapstoneProject.reduce(r) == {-2, 1}
    end

    test "Reduce one to lowest terms" do
      r = {13, 13}

      assert CapstoneProject.reduce(r) == {1, 1}
    end
  end
end
