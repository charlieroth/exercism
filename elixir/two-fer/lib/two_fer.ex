defmodule TwoFer do
  @doc """
  Two-fer or 2-fer is short for two for one. One for you and one for me.
  """
  def two_fer(name) when is_integer(name), do: raise(FunctionClauseError)
  def two_fer(name) when is_atom(name), do: raise(FunctionClauseError)
  def two_fer(name) when is_list(name), do: raise(FunctionClauseError)
  def two_fer(name), do: "One for #{name}, one for me."
  def two_fer(), do: "One for you, one for me."
end
