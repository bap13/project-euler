# Fibonacci. A script that sums all even Fibonacci numbers from 1 to n.

def even_fib(n)
  num = [1, 1, 0]
  sum = 0

  until num[1] + num[0] > n do
    num[2] = num[1] + num[0]
    num.shift
    sum += num[1] if num[1].even?
  end
  
  return sum
end
