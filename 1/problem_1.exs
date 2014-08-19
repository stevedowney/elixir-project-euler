defmodule ProjectEuler.Problem1 do
  
  @moduledoc """
  
  # Problem 1 Multiples of 3 and 5
  
  If we list all the natural numbers below 10 that are multiples of 3 or 5,
  we get 3, 5, 6 and 9. The sum of these multiples is 23.

  Find the sum of all the multiples of 3 or 5 below 1000.
  
  """

  def solve(n) do
    1..(n-1)
      |> Enum.filter(&divisible_by_3_or_5?(&1))
      |> Enum.sum
  end
  
  defp divisible_by_3_or_5?(n) do
    cond do
      rem(n, 3) == 0 -> true
      rem(n, 5) == 0 -> true
      true           -> false
    end
  end
  
end

{time, solution} = :timer.tc(fn -> ProjectEuler.Problem1.solve(1000) end)
IO.puts solution             # 233168
IO.puts "#{time / 1000} ms"  # 2.356 ms