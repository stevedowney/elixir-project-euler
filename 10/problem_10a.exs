defmodule ProjectEuler.Problem10a do
  
  @moduledoc """
  
  Problem 10: Summation of primes
  
  The sum of the primes below 10 is 2 + 3 + 5 + 7 = 17.

  Find the sum of all the primes below two million.
  
  """
  
  @limit 2_000_000
  
  def solve do
    solve(2, 0)
  end
  
  def solve(n, acc) do
    cond do
      n > @limit -> acc
      Prime.prime?(n)  -> solve(n+1, acc+n)
      true       -> solve(n+1, acc)
    end
  end
  
end

defmodule Prime do
  
  def prime?(2), do: true
  def prime?(3), do: true
  def prime?(n) when rem(n, 2) == 0, do: false
  
  def prime?(prime_candidate) do
    max_divisor = max(2, trunc(:math.sqrt(prime_candidate)))
    prime?(prime_candidate, 3, max_divisor)
  end
  
  defp prime?(prime_candidate, current_divisor, max_divisor) do
    cond do
      current_divisor > max_divisor -> true
      rem(prime_candidate, current_divisor) == 0 -> false
      true -> prime?(prime_candidate, current_divisor + 2, max_divisor)
    end
  end
end

# IO.inspect Prime.primes_up_to(10)
{time, solution} = :timer.tc(fn -> ProjectEuler.Problem10a.solve end)
IO.inspect solution          # 142913828922
IO.puts "#{time / 1000} ms"  # 3465.767 ms