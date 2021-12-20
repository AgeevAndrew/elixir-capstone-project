defmodule CapstoneProject do
  @moduledoc """
  Documentation for `CapstoneProject`.
  """

  @type rational :: {integer, integer}

  @doc """
  Add two rational numbers
  """
  @spec add(a :: rational, b :: rational) :: rational
  def add(a, b) do
    {{a1, b1}, {a2, b2}} = {a, b}
    {(a1 * b2 + a2 * b1), b1 * b2}
    |> reduce()
  end

  @doc """
  Subtract two rational numbers
  """
  @spec subtract(a :: rational, b :: rational) :: rational
  def subtract(a, b) do
    {{a1, b1}, {a2, b2}} = {a, b}
    {(a1 * b2 - a2 * b1), b1 * b2}
    |> reduce()
  end

  @doc """
  Multiply two rational numbers
  """
  @spec multiply(a :: rational, b :: rational) :: rational
  def multiply(a, b) do
    {{a1, b1}, {a2, b2}} = {a, b}
    {a1 * a2, b1 * b2}
    |> reduce()
  end

  @doc """
  Divide two rational numbers
  """
  @spec divide_by(num :: rational, den :: rational) :: rational
  def divide_by(num, den) do
    {{a1, b1}, {a2, b2}} = {num, den}
    {a1 * b2, a2 * b1}
    |> reduce()
  end

  @doc """
  Absolute value of a rational number
  """
  @spec abs(a :: rational) :: rational
  def abs(a) do
    {n, d} = a
    {Kernel.abs(n), Kernel.abs(d)}
  end

  @doc """
  Exponentiation of a rational number by an integer
  """
  @spec pow_rational(a :: rational, n :: integer) :: rational
  def pow_rational(a, n) do
    {nom, den} = a
    {Integer.pow(nom, n), Integer.pow(den, n)}
  end

  @doc """
  Exponentiation of a real number by a rational number
  """
  @spec pow_real(x :: integer, n :: rational) :: float
  def pow_real(x, n) do
    {nom, den} = n
    Float.pow(x / 1, nom)
    |> Float.pow(1 / den)
  end

  @doc """
  Reduce a rational number to its lowest terms
  """
  @spec reduce(a :: rational) :: rational
  def reduce(a) do
    {nom, den} = a
    nod = Integer.gcd(nom, den)
    cond do
      den < 0 -> {-round(nom / nod), Kernel.abs(round(den / nod))}
      true -> {round(nom / nod), round(den / nod)}
    end
  end
end
