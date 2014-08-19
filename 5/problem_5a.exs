defmodule ProjectEuler.Problem5a do
  
  @moduledoc """
  
  Problem 5: Smallest multiple
  
  2520 is the smallest number that can be divided by each of the numbers from 1 to 10 without any remainder.

  What is the smallest positive number that is evenly divisible by all of the numbers from 1 to 20?
  
  """
  
  @numbers Enum.to_list 20..2
  
  def solve do
    _solve(21, @numbers)
  end
  
  defp _solve(n, []), do: n
  
  defp _solve(n, [h | t]) do
    case rem(n, h) do
      0 -> _solve(n, t)           # n divisible by first number, try next
      _ -> _solve(n+1, @numbers)  # n not divisible, try next n
    end
  end 

end

{time, solution} = :timer.tc(fn -> ProjectEuler.Problem5a.solve end)
IO.puts solution             # 232_792_560
IO.puts "#{time / 1000} ms"  # 5813.441 ms