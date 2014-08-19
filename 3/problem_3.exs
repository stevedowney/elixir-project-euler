defmodule ProjectEuler.Problem3 do
  
  @moduledoc """
  Problem 3: Largest prime factor
  
  The prime factors of 13195 are 5, 7, 13 and 29.

  What is the largest prime factor of the number 600851475143 ?

  """
  
  def solve(n), do: _solve(n, 2)

  def _solve(n, n), do: n
  
  def _solve(n, factor) do
    case rem(n, factor) do
      0 -> _solve(div(n, factor), factor)
      _ -> _solve(n, factor + 1)
    end
  end
  
end

{time, solution} = :timer.tc(fn -> ProjectEuler.Problem3.solve(600851475143) end)
IO.puts solution             # 6857
IO.puts "#{time / 1000} ms"  # 0.17 ms