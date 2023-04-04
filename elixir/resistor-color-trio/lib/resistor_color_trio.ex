defmodule ResistorColorTrio do
  @doc """
  Calculate the resistance value in ohms from resistor colors
  """
  @spec label(colors :: [atom]) :: {number, :ohms | :kiloohms | :megaohms | :gigaohms}
  def label(colors) do
  end

  black: 0
  brown: 1
  red: 2
  orange: 3
  yellow: 4
  green: 5
  blue: 6
  violet: 7
  grey: 8
  white: 9


end
