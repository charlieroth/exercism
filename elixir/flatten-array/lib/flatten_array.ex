defmodule FlattenArray do
  @doc """
    Accept a list and return the list flattened without nil values.

    ## Examples

      iex> FlattenArray.flatten([1, [2], 3, nil])
      [1,2,3]

      iex> FlattenArray.flatten([nil, nil])
      []

  """

  @spec flatten(list) :: list
  def flatten(list) do
    no_nils = []

    if list == [] do
      no_nils
    else
      list
      |> Enum.reduce(no_nils, fn el, acc ->
        recur(el, acc)
      end)
    end
  end

  def recur(list, acc) when is_list(list) do
    if length(list) == 0 do
      acc
    else
      [hd | _rest] = list
      recur(hd, acc)
    end
  end

  def recur(el, acc) when is_integer(el) do
    [el | acc]
  end

  def recur(el, acc) when is_nil(el) do
    acc
  end
end
