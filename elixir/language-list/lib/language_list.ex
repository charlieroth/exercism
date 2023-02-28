defmodule LanguageList do
  def new() do
    []
  end

  def add(list, language) do
    [language] ++ list
  end

  def remove(list) do
    [_ | rest] = list
    rest
  end

  def first(list) do
    list |> Enum.at(0)
  end

  def count(list) do
    list |> Enum.count()
  end

  def functional_list?(list) do
    list |> Enum.any?(fn lang -> lang == "Elixir" end)
  end
end
