defmodule RPG.CharacterSheet do
  @spec welcome :: :ok
  def welcome() do
    "Welcome! Let's fill out your character sheet together." |> IO.puts()
  end

  @spec ask_name :: binary
  def ask_name() do
    "What is your character's name?\n"
    |> IO.gets()
    |> String.trim()
  end

  @spec ask_class :: binary
  def ask_class() do
    "What is your character's class?\n"
    |> IO.gets()
    |> String.trim()
  end

  def ask_level() do
    {level, _} =
      "What is your character's level?\n"
      |> IO.gets()
      |> String.trim()
      |> Integer.parse()

    level
  end

  def run() do
    welcome()

    character =
      Map.new()
      |> Map.put(:name, ask_name())
      |> Map.put(:class, ask_class())
      |> Map.put(:level, ask_level())

    IO.inspect(character, label: "Your character")
  end
end
