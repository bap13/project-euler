require 'prime'

limit = 1000

b_range = Prime.each(limit).map { |prime| -prime } + Prime.each(limit).to_a
max_consec = 0
max_a = 0
max_b = 0

for b in b_range
  for a in ((-limit + 1)...limit)
    n = 0
    while ((n**2 + (a * n) + b).prime?)
      n += 1
    end
    if n > max_consec
      max_a = a
      max_b = b
      max_consec = n
    end
  end
end

puts "a = #{max_a} and b = #{max_b} produce #{max_consec} primes."
