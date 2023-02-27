defmodule FreelancerRates do
  def daily_rate(hourly_rate) do
    8.0 * hourly_rate
  end

  def apply_discount(before_discount, discount) do
    discount
      |> (&((100.0 - &1) / 100.0)).()
      |> (&(&1 * before_discount)).()
  end

  def monthly_rate(hourly_rate, discount) do
    if discount > 0.0 do
      hourly_rate
        |> daily_rate()
        |> apply_discount(discount)
        |> (&(&1 * 22.0)).()
        |> ceil()
    else
      hourly_rate
        |> daily_rate()
        |> (&(&1 * 22.0)).()
        |> ceil()
    end
  end

  def days_in_budget(budget, hourly_rate, discount) do
    if discount > 0.0 do
      hourly_rate
        |> daily_rate()
        |> apply_discount(discount)
        |> (&(budget / &1)).()
        |> Float.floor(1)
    else
      hourly_rate
        |> daily_rate()
        |> (&(budget / &1)).()
        |> Float.floor(1)
    end
  end
end
