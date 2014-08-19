defmodule ProjectEuler.Problem6 do
  
  @moduledoc """
  
  Problem 6: Sum square difference
  
  The sum of the squares of the first ten natural numbers is,

    12 + 22 + ... + 102 = 385
    
  The square of the sum of the first ten natural numbers is,

    (1 + 2 + ... + 10)2 = 552 = 3025
    
  Hence the difference between the sum of the squares of the first ten natural
  numbers and the square of the sum is 3025 − 385 = 2640.

  Find the difference between the sum of the squares of the first one hundred
  natural numbers and the square of the sum.
  
  """
  
  def solve(n \\ 10) do
    list = Enum.to_list 1..n
    square_of_sums(list) - sum_of_squares(list)
  end
  
  defp sum_of_squares(list) do
    list
      |> Enum.map(&(&1*&1))
      |> Enum.sum
  end
  
  defp square_of_sums(list) do
    list
      |> Enum.sum
      |> (&(&1*&1)).()
  end
  
end

{time, solution} = :timer.tc(fn -> ProjectEuler.Problem6.solve(100) end)
IO.puts solution             # 25164150
IO.puts "#{time / 1000} ms"  # 2.111 ms