defmodule Darts do
  @type position :: {number, number}

  @doc """
  Calculate the score of a single dart hitting a target
  """
  @spec score({number, number}) :: 0 | 1 | 5 | 10
  def score({_x, _y} = hit_coordinates) do
    hit_coordinates
    |>  euclidean_distance({0, 0})
    |> calculate_score()
  end

  def calculate_score(distance)
    when distance > 10.0, do: 0

  def calculate_score(distance)
    when distance > 5.0 and distance <= 10.0, do: 1

  def calculate_score(distance)
    when distance > 1.0 and distance <= 5.0, do: 5

    def calculate_score(_distance), do: 10

  @doc """
  Calculate the euclidean distance between two points
  """
  @spec euclidean_distance({number, number}, {number, number}) :: float
  def euclidean_distance({x1, y1} = _p1, {x2, y2} = _p2) do
    :math.pow(x2 - x1, 2)
    |> Kernel.+(:math.pow(y2 - y1, 2))
    |> :math.sqrt()
    |> Float.round(2)
  end
end
