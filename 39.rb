require 'benchmark'

solve = Proc.new do
  perimeters = Hash.new(0)

  (1..500).each do |a|
    (1..500).each do |b|
      c = Math.sqrt(a**2 + b**2)
      p = a + b + c
      next if !(c.to_i == c) || p > 1000
      perimeters[p.to_i] += 1
    end
  end

  perimeters.max_by { |_, v| v }.inspect
end

puts solve.call

Benchmark.bm(6) do |x|
  x.report("solve:") { solve.call }
end
