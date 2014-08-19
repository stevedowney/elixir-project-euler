defmodule ProjectEuler.Problem4b do
  
  @moduledoc """
  
  A palindromic number reads the same both ways. The largest palindrome made
  from the product of two 2-digit numbers is 9009 = 91 × 99.

  Find the largest palindrome made from the product of two 3-digit numbers.
  
  """
  
  def solve do
    Enum.reduce(1..999, 0, fn(n, max) ->
      Enum.reduce(n..999, max, fn(m, max) ->
        keep_largest_palindrome(n*m, max)
      end)
    end)
  end
  
  def keep_largest_palindrome(product, max) do
    if product > max and palindrome?(product) do
      product
    else
      max
    end
  end
  
  def palindrome?(number) do
    string = Integer.to_string(number)
    string == String.reverse(string)
  end
  
end

{time, solution} = :timer.tc(fn -> ProjectEuler.Problem4b.solve end)
IO.puts solution             # 906609
IO.puts "#{time / 1000} ms"  # 156.92 ms