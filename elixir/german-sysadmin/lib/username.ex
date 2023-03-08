defmodule Username do
  def sanitize(''), do: ''

  def sanitize([head | tail]) do
    sanitized =
      case head do
        ?ä -> 'ae'
        ?ö -> 'oe'
        ?ü -> 'ue'
        ?ß -> 'ss'
        c when c >= ?a and c <= ?z -> [c]
        ?_ -> '_'
        _ -> ''
      end

    sanitized ++ sanitize(tail)
  end
end
