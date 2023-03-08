defmodule NameBadge do
  @doc """
  The point of this exercise is to use if statements

  This could easily be done with pattern matching in the function
  definition
  """
  @spec print(String.t() | nil, String.t() | nil, String.t() | nil) :: String.t()
  def print(id, name, department) do
    if is_nil(id) do
      if is_nil(department) do
        "#{name} - OWNER"
      else
        "#{name} - #{String.upcase(department)}"
      end
    else
      if is_nil(department) do
        "[#{id}] - #{name} - OWNER"
      else
        "[#{id}] - #{name} - #{String.upcase(department)}"
      end
    end
  end
end
