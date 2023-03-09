defmodule WineCellar do
  def explain_colors do
    [
      white: "Fermented without skin contact.",
      red: "Fermented with skin contact using dark-colored grapes.",
      rose: "Fermented with some skin contact, but not enough to qualify as a red wine."
    ]
  end

  def filter(cellar, color, opts \\ []) do
    cellar
    |> filter_by_color(color)
    |> filter_by_year(opts[:year])
    |> filter_by_country(opts[:country])
  end

  defp filter_by_color(wines, color), do: Keyword.get_values(wines, color)

  # The functions below do not need to be modified.

  defp filter_by_year(wines, year)
  # When opts[:year] is nil, return wines
  defp filter_by_year(wines, nil), do: wines
  defp filter_by_year([], _year), do: []

  defp filter_by_year([{_, year, _} = wine | tail], year) do
    [wine | filter_by_year(tail, year)]
  end

  defp filter_by_year([{_, _, _} | tail], year) do
    filter_by_year(tail, year)
  end

  defp filter_by_country(wines, country)
  # When opts[:country] is nil, return wines
  defp filter_by_country(wines, nil), do: wines
  defp filter_by_country([], _country), do: []

  defp filter_by_country([{_, _, country} = wine | tail], country) do
    [wine | filter_by_country(tail, country)]
  end

  defp filter_by_country([{_, _, _} | tail], country) do
    filter_by_country(tail, country)
  end
end
