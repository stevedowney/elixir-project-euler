defmodule ProjectEuler.Problem7 do
  
  @moduledoc """
  
  Problem 7: 10001st prime

  By listing the first six prime numbers: 2, 3, 5, 7, 11, and 13, 
  we can see that the 6th prime is 13.

  What is the 10 001st prime number?
  
  """
  
  def solve(n) do
    nth_prime(5, n, 2)
  end
  
  def nth_prime(prime, n, n), do: prime - 1
  
  def nth_prime(candidate, n, prime_count) do
    case prime?(candidate) do
      true -> nth_prime(candidate + 1, n, prime_count + 1)
      _    -> nth_prime(candidate + 1, n, prime_count)
    end
  end
  
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

{time, solution} = :timer.tc(fn -> ProjectEuler.Problem7.solve(10001) end)
IO.puts solution             # 104743
IO.puts "#{time / 1000} ms"  # 60.5 ms