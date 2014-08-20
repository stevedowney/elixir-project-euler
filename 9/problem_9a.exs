defmodule ProjectEuler.Problem9a do
  
  @moduledoc """
  
  Problem 9: Special Pythagorean triplet
  
  A Pythagorean triplet is a set of three natural numbers, a < b < c, for which,

    a2 + b2 = c2
    
  For example, 32 + 42 = 9 + 16 = 25 = 52.

  There exists exactly one Pythagorean triplet for which a + b + c = 1000.
  
  Find the product abc.
  
  """
  
  @limit 500
  
  def solve do
    Enum.at(list, 0)
  end
  
  def list do
    for a <- 1..@limit,
        b <- a..@limit,
        c <- b..@limit,
        a+b+c == 1000 and a*a + b*b == c*c,
        do: a*b*c
  end

end

{time, solution} = :timer.tc(fn -> ProjectEuler.Problem9a.solve end)
IO.inspect solution          # 31875000
IO.puts "#{time / 1000} ms"  # 2949.399 ms