defmodule GuessingGame do
  def compare(secret_number, guess \\ nil) do
    respond(secret_number, guess)
  end

  def respond(_secret, guess) when not is_integer(guess), do: "Make a guess"
  def respond(secret, guess) when abs(secret - guess) == 1, do: "So close"
  def respond(secret, guess) when guess < secret, do: "Too low"
  def respond(secret, guess) when guess > secret, do: "Too high"
  def respond(_secret, _guess), do: "Correct"
end
