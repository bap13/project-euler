require './pandigital.rb'
require 'benchmark'

solve = Proc.new do
  pandigitals = (2..9).each_with_object([]) do |n, pan|
    range = (1..n)
    max_digits = (9 / n.to_f).ceil
    max_num = 10**(max_digits) - 1

    (1..max_num).each do |k|
      cat = range.reduce([]) { |a, e| a << k*e }
      pan << cat.join('') if cat.is_pandigital?
    end
  end

  pandigitals.max
end

puts solve.call

Benchmark.bm(6) do |x|
  x.report('solve:') { solve.call }
end
