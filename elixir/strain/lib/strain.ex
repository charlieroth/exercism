defmodule Strain do
  @doc """
  Given a `list` of items and a function `fun`, return the list of items where
  `fun` returns true.

  Do not use `Enum.filter`.
  """
  @spec keep(list :: list(any), fun :: (any -> boolean)) :: list(any)
  def keep([], _fun), do: []

  def keep(list, fun) do
    keeper(list, [], fun)
  end

  defp keeper([head | tail], acc, fun) do
    if fun.(head) do
      keeper(tail, [head | acc], fun)
    else
      keeper(tail, acc, fun)
    end
  end

  defp keeper([], acc, _fun), do: Enum.reverse(acc)

  @doc """
  Given a `list` of items and a function `fun`, return the list of items where
  `fun` returns false.

  Do not use `Enum.reject`.
  """
  @spec discard(list :: list(any), fun :: (any -> boolean)) :: list(any)
  def discard([], _fun), do: []

  def discard(list, fun) do
    discarder(list, [], fun)
  end

  defp discarder([head | tail], acc, fun) do
    if fun.(head) do
      discarder(tail, acc, fun)
    else
      discarder(tail, [head | acc], fun)
    end
  end

  defp discarder([], acc, _fun), do: Enum.reverse(acc)
end
