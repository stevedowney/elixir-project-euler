defmodule ProjectEuler.Problem7b do
  
  @moduledoc """
  
  Problem 7: 10001st prime

  By listing the first six prime numbers: 2, 3, 5, 7, 11, and 13, 
  we can see that the 6th prime is 13.

  What is the 10 001st prime number?
  
  """
  
  def solve(n) do
    nth_prime(5, n, [2, 3], 2)
  end
  
  def nth_prime(candidate, n, _acc_primes, n), do: candidate - 1
  
  def nth_prime(candidate, n, acc_primes, prime_count) do
    max_divisor = :math.sqrt(candidate)
    case prime?(candidate, acc_primes, max_divisor) do
      true -> nth_prime(candidate + 1, n, acc_primes ++ [candidate], prime_count + 1)
      _    -> nth_prime(candidate + 1, n, acc_primes, prime_count)
    end
  end
  
  def prime?(2, _acc_primes, _max_divisor), do: true
  def prime?(3, _acc_primes, _max_divisor), do: true
  def prime?(n, _acc_primes, _max_divisor) when rem(n, 2) == 0, do: false
  def prime?(_n, [], _max_divisor), do: true
  
  def prime?(prime_candidate, [divisor | tail], max_divisor) do
    cond do
      divisor > max_divisor -> true
      rem(prime_candidate, divisor) == 0 -> false
      true -> prime?(prime_candidate, tail, max_divisor)
    end
  end  

end

{time, solution} = :timer.tc(fn -> ProjectEuler.Problem7b.solve(10001) end)
IO.puts solution             # 104743
IO.puts "#{time / 1000} ms"  # 310.5 ms