defmodule ProjectEuler.Problem5b do
  
  @moduledoc """
  
  Problem 5: Smallest multiple
  
  2520 is the smallest number that can be divided by each of the numbers from 1 to 10 without any remainder.

  What is the smallest positive number that is evenly divisible by all of the numbers from 1 to 20?
  
  """
  
  @doc "Implementation of solution explained here: http://codereview.stackexchange.com/a/13089/51197"
  
  def solve do
    2..20
      |> Enum.map(&Prime.prime_factors/1)
      |> Enum.reduce(&required_factors/2)  
      |> Enum.reduce(1, &*/2)
  end
  
  defp required_factors(factors, acc), do: required_factors(factors, factors, acc)
  
  defp required_factors(_, [], acc), do: acc
  
  defp required_factors(factors, [factor | tail], acc) do
    additions = additional_factors(factors, factor, acc)
    required_factors(factors, tail, acc ++ additions)
  end
  
  defp additional_factors(factors, factor, acc) do
    add_count = max(0, count(factors, factor) - count(acc, factor))
    List.duplicate(factor, add_count)
  end
  
  defp count(list, element) do
    Enum.count(list, &(&1 == element))
  end
end

defmodule Prime do
  
  def prime_factors(n) do
    prime_factors(n, primes_up_to(n), [])
  end
  
  defp prime_factors(n, possible_factors = [h|t], acc) do
    cond do
      n == h         -> [n | acc]
      rem(n, h) == 0 -> prime_factors(div(n, h), possible_factors, [h | acc])
      true           -> prime_factors(n, t, acc)
    end
  end
  
  def primes_up_to(limit) do
    Enum.filter(2..limit, &prime?/1)
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

{time, solution} = :timer.tc(fn -> ProjectEuler.Problem5b.solve end)
IO.puts solution             # 232_792_560
IO.puts "#{time / 1000} ms"  # 3.1 ms