require 'prime'
require 'benchmark'

CANDIDATES = [2, 3, 5, 7] + (2..6).flat_map do |len|
  [1, 3, 7, 9].repeated_permutation(len)
              .map { |n| n.join('').to_i }
              .select(&:prime?)
end

CIRCULAR = -> (n) do
  len = Math.log10(n).ceil
  p = 10**(len - 1)
  len.times do
    return false if !n.prime?
    n = n / 10 + (n % 10 * p)
  end
end

solve = Proc.new do
  CANDIDATES.count(&CIRCULAR)
end

puts solve.call


# Benchmark -----------------------------------------
Benchmark.bm(15) do |x|
  x.report("solve:") { solve.call }
end
