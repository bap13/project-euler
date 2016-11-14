require 'benchmark'

factorial = -> (n) do 
  return 1 if n <= 1
  n * factorial.call(n - 1)
end

f = (0..9).map(&factorial)

is_factorion = -> (n) do 
  sum = 0
  tmp = n
  while tmp > 0
    digit = tmp % 10
    sum += f[digit]
    tmp /= 10
  end
  sum == n
end

upper = f[1] + f[8] + 5*f[9]

factorions = Proc.new do
  (10..upper).select(&is_factorion)
end

puts factorions.call.inspect

Benchmark.bm(11) do |x|
  x.report("factorions:") { factorions.call }
end

