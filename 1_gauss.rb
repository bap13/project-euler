def sumn(n, d)
  n /= d
  d * n * (n + 1) / 2
end

limit = 1000 - 1
a = 3
b = 5

puts sumn(limit, a) + sumn(limit, b) - sumn(limit, a * b)
