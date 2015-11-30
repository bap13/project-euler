# What is the smallest positive number that is evenly divisible
# by all of the numbers from 1 to n?

def smallest_multiple(n)
  return n if n <= 1
  smallest_multiple(n - 1).lcm(n)
end
