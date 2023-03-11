defmodule LibraryFees do
  @moduledoc false

  @spec datetime_from_string(String.t()) :: NaiveDateTime.t()
  def datetime_from_string(string), do: NaiveDateTime.from_iso8601!(string)

  @spec before_noon?(NaiveDateTime.t()) :: boolean()
  def before_noon?(datetime), do: datetime.hour < 12

  @spec return_date(NaiveDateTime.t()) :: Date.t()
  def return_date(checkout_datetime) do
    duration =
      checkout_datetime
      |> before_noon?()
      |> rental_duration()

    checkout_datetime
    |> NaiveDateTime.add(duration, :day)
    |> NaiveDateTime.to_date()
  end

  defp rental_duration(true = _checkout_before_noon?), do: 28
  defp rental_duration(false = _checkout_before_noon?), do: 29

  @spec days_late(Date.t(), NaiveDateTime.t()) :: integer()
  def days_late(planned_return_date, actual_return_datetime) do
    days =
      actual_return_datetime
      |> NaiveDateTime.to_date()
      |> Date.diff(planned_return_date)

    case days <= 0 do
      true -> 0
      false -> days
    end
  end

  @spec monday?(NaiveDateTime.t()) :: boolean()
  def monday?(datetime) do
    day_of_week =
      datetime
      |> NaiveDateTime.to_date()
      |> Date.day_of_week()

    day_of_week == 1
  end

  @spec calculate_late_fee(String.t(), String.t(), integer()) :: integer()
  def calculate_late_fee(checkout, return, rate) do
    planned_return = checkout |> datetime_from_string() |> return_date()
    actual_return = return |> datetime_from_string()
    days_late = planned_return |> days_late(actual_return)
    is_monday = actual_return |> monday?()

    case days_late <= 0 do
      true ->
        0

      false ->
        if is_monday do
          (days_late * rate * 0.5) |> trunc()
        else
          days_late * rate
        end
    end
  end
end
