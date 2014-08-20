defmodule ProjectEuler.Problem9c do
  
  @moduledoc """
  
  Problem 9: Special Pythagorean triplet
  
  A Pythagorean triplet is a set of three natural numbers, a < b < c, for which,

    a2 + b2 = c2
    
  For example, 32 + 42 = 9 + 16 = 25 = 52.

  There exists exactly one Pythagorean triplet for which a + b + c = 1000.
  
  Find the product abc.
  
  """
  
  @limit 500
  
  def solve, do: solve(1)
  
  def solve(a), do: solve(a, a+1)
  
  def solve(a, @limit), do: solve(a+1, a+2)
  
  def solve(a, b) do
    c = 1000 - a - b
    product_if_square(a, b, c) || solve(a, b+1)
  end

  def product_if_square(a, b, c) do
    if a*a + b*b == c*c do
      a*b*c
    end
  end

end

{time, solution} = :timer.tc(fn -> ProjectEuler.Problem9c.solve end)
IO.inspect solution          # 31875000
IO.puts "#{time / 1000} ms"  # 8.724 ms ms