defmodule RationalNumbers do
  @type rational :: {integer, integer}

  @doc """
  Add two rational numbers
  """
  @spec add(a :: rational, b :: rational) :: rational
  def add({a1, a2} = _a, {b1, b2} = _b) do
    reduce({a1 * b2 + a2 * b1, b1 * b2})
  end

  @doc """
  Subtract two rational numbers
  """
  @spec subtract(a :: rational, b :: rational) :: rational
  def subtract({a1, a2}, {b1, b2}) do
    reduce({a1 * b2 - a2 * b1, b1 * b2})
  end

  @doc """
  Multiply two rational numbers
  """
  @spec multiply(a :: rational, b :: rational) :: rational
  def multiply({a1, a2}, {b1, b2}) do
    reduce({a1 * a2, b1 * b2})
  end

  @doc """
  Divide two rational numbers
  """
  @spec divide_by(num :: rational, den :: rational) :: rational
  def divide_by({a1, a2}, {b1, b2}) do
    reduce({a1 * b2, a2 * b1})
  end

  @doc """
  Absolute value of a rational number
  """
  @spec abs(a :: rational) :: rational
  def abs({a1, a2}) do
    reduce({Kernel.abs(a1), Kernel.abs(a2)})
  end

  @doc """
  Exponentiation of a rational number by an integer
  """
  def pow_rational({a, b}, n) when n <= 0 do
    reduce({b ** Kernel.abs(n), a ** Kernel.abs(n)})
  end

  def pow_rational({a, b}, n), do: reduce({a ** n, b ** n})

  @doc """
  Exponentiation of a real number by a rational number
  """
  @spec pow_real(x :: integer, n :: rational) :: float
  def pow_real(x, {a, b}) do
    x ** (a / b)
  end

  @doc """
  Reduce a rational number to its lowest terms
  """
  def reduce({a, b}) when b < 0 do
    reduce({trunc(-a), trunc(-b)})
  end

  def reduce({a, b}) do
    case Integer.gcd(trunc(a), trunc(b)) do
      0 -> {trunc(a), trunc(b)}
      gcd -> {trunc(a / gcd), trunc(b / gcd)}
    end
  end
end
