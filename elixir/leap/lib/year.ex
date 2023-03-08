defmodule Year do
  @doc """
  Returns whether 'year' is a leap year.

  A leap year occurs:

  on every year that is evenly divisible by 4
    except every year that is evenly divisible by 100
      unless the year is also evenly divisible by 400
  """
  @spec leap_year?(non_neg_integer) :: boolean
  def leap_year?(year) do
    div_by_four = rem(year, 4) == 0
    div_by_one_hund = rem(year, 100) == 0
    div_by_four_hund = rem(year, 400) == 0
    is_leap_year?(div_by_four, div_by_one_hund, div_by_four_hund)
  end

  defp is_leap_year?(true, _, true), do: true
  defp is_leap_year?(true, false, _), do: true
  defp is_leap_year?(_, _, _), do: false
end
