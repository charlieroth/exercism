defmodule HighScore do
  def new(), do: Map.new()

  def add_player(scores, name), do: Map.put(scores, name, 0)
  def add_player(scores, name, score), do: Map.put(scores, name, score)

  def remove_player(scores, name), do: Map.delete(scores, name)

  def reset_score(scores, name), do: Map.put(scores, name, 0)

  def update_score(scores, name, score) do
    Map.update(scores, name, score, &(&1 + score))
  end

  def get_players(scores) do
    Enum.map(scores, fn {name, _} -> name end)
  end
end
