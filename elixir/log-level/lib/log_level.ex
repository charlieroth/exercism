defmodule LogLevel do
  def to_label(level, legacy?) do
    case get_config(level) do
      :error ->
        IO.puts("not found")
        :unknown

      config ->
        {label, support} = config
        cond do
          legacy? and support -> label
          not legacy? and support -> label
          legacy? and not support -> :unknown
          not legacy? -> label
          true -> :unknown
        end
    end
  end

  def alert_recipient(level, legacy?) do
    label = to_label(level, legacy?)
    case label do
      :error -> :ops
      :fatal -> :ops
      :unknown ->
        case legacy? do
          true -> :dev1
          false -> :dev2
        end
      _ -> false
    end
  end

  defp get_config(level) do
    case level do
      0 -> {:trace, false}
      1 -> {:debug, true}
      2 -> {:info, true}
      3 -> {:warning, true}
      4 -> {:error, true}
      5 -> {:fatal, false}
      _ -> :error
    end
  end
end
