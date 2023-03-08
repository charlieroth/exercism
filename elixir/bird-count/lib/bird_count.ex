defmodule BirdCount do
  def today(list) when list == [], do: nil
  def today(list), do: Enum.at(list, 0)

  def increment_day_count([]), do: [1]
  def increment_day_count([today | rest] = _list), do: [today + 1] ++ rest

  def has_day_without_birds?([]), do: false

  def has_day_without_birds?(list) do
    Enum.reduce_while(list, false, fn day, acc ->
      case day do
        0 -> {:halt, true}
        _ -> {:cont, acc}
      end
    end)
  end

  def total([]), do: 0
  def total(list), do: Enum.sum(list)

  def busy_days([]), do: 0
  def busy_days(list), do: Enum.count(list, fn day -> day >= 5 end)
end
