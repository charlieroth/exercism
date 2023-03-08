defmodule Username do
  def sanitize(''), do: ''

  def sanitize(username) do
    try do
      username
      |> to_string()
      |> String.replace(~r/[\x{00DF}]/u, "ss")
      |> String.replace(~r/[\x{00E4}]/u, "ae")
      |> String.replace(~r/[\x{00F6}]/u, "oe")
      |> String.replace(~r/[\x{00FC}]/u, "ue")
      |> String.replace(~r/\d/u, "")
      |> String.codepoints()
      |> Enum.filter(&Regex.match?(~r/[\w_]/, &1))
      |> Enum.join()
      |> to_charlist()
    rescue
      _ -> ''
    end

    # ä becomes ae
    # ö becomes oe
    # ü becomes ue
    # ß becomes ss

    # Please implement the sanitize/1 function
  end
end
