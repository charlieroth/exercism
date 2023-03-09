defmodule TakeANumber do
  def start() do
    spawn(__MODULE__, :loop, [0])
  end

  def loop(state) do
    receive do
      {:report_state, from} ->
        send(from, state)
        loop(state)

      {:take_a_number, from} ->
        new_state = state + 1
        send(from, new_state)
        loop(new_state)

      :stop ->
        # NOTE: Since `loop/1` is not called here. The process will exit
        :ok

      _ ->
        loop(state)
    end
  end
end
