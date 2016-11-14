require 'prime'

limit = 1_000_000

primes = Prime.each(limit).to_a
sums = [0]

primes.each_with_index do |p, i|
  sums[i + 1] = sums[i] + p
end

n = 0 
result = 0

(1..(sums.length - 1)).each do |i|
  (i - (n + 1)).downto(0).each do |j|
    candidate = sums[i] - sums[j]
    break if candidate > limit
    if candidate.prime?
      n = i - j 
      result = candidate
    end
  end
end

puts result

