defmodule GuessingGame do
  def guess(a, b) when a > b do
    guess(b, a)
  end

  def guess(low, high) do
    IO.puts("Low end: #{low}")
    IO.puts("High end: #{high}")
    feedback = IO.gets("Is your number #{calculate_middle(low, high)}?\n")

    case String.trim(feedback) do
      "bigger" ->
        bigger(low, high)

      "smaller" ->
        smaller(low, high)

      "correct" ->
        IO.puts("Thanks for playing!")

      _ ->
        IO.puts("Please input valid response -> bigger/smaller/correct")
        guess(low, high)
    end
  end

  def calculate_middle(low, high) do
    div(low + high, 2)
  end

  def bigger(low, high) do
    low_new = min(high, calculate_middle(low, high) + 1)
    guess(low_new, high)
  end

  def smaller(low, high) do
    high_new = max(low, calculate_middle(low, high) - 1)
    guess(low, high_new)
  end
end
