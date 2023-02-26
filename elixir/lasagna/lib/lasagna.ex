defmodule Lasagna do
  # Please define the 'expected_minutes_in_oven/0' function
  def expected_minutes_in_oven() do
    40
  end

  # Please define the 'remaining_minutes_in_oven/1' function
  def remaining_minutes_in_oven(mins_in_oven) do
    40 - mins_in_oven
  end

  # Please define the 'preparation_time_in_minutes/1' function
  def preparation_time_in_minutes(num_layers) do
    num_layers * 2
  end

  # Please define the 'total_time_in_minutes/2' function
  def total_time_in_minutes(num_layers, num_mins_in_oven) do
    (num_layers * 2) + num_mins_in_oven
  end

  # Please define the 'alarm/0' function
  def alarm() do
    "Ding!"
  end
end
