S = [1, 2, 5, 10, 20, 50, 100, 200]
target = 200

def count(n, m)
  return 0 if n < 0 || m < 0
  return 1 if n == 0
  count(n, m - 1) + count(n - S[m], m)
end

puts count(target, S.length - 1)
