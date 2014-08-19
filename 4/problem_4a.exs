defmodule ProjectEuler.Problem4a do
  
  @moduledoc """
  
  Problem 4: Largest palindrome product
  
  A palindromic number reads the same both ways. The largest palindrome made
  from the product of two 2-digit numbers is 9009 = 91 × 99.

  Find the largest palindrome made from the product of two 3-digit numbers.
  
  """

  @range 111..999
    
  def solve do
    products
      |> Enum.filter(&palindrome?(&1))
      |> Enum.max
  end
  
  defp products do
    for first  <- @range,
        second <- @range,
        do: first * second
  end

  defp palindrome?(number) do
    string = Integer.to_string(number)
    string == String.reverse(string)
  end
  
end

{time, solution} = :timer.tc(fn -> ProjectEuler.Problem4a.solve end)
IO.puts solution             # 906609
IO.puts "#{time / 1000} ms"  # 1060.673 ms