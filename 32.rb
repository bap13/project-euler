require 'benchmark'

class Integer
  def is_pandigital?
    n = self
    contains = Array.new(10, false)

    !!9.times do
      digit = n % 10
      return false if digit == 0 || contains[digit]
      contains[digit] = true
      n /= 10
    end
  end
end

class Array
  def is_pandigital?
    a = self
    return false unless a.join.length == 9
    contains = Array.new(10, false)

    !!a.each do |n|
      while n > 0
        digit = n % 10
        return false if digit == 0 || contains[digit]
        contains[digit] = true
        n /= 10
      end
    end
  end

  def identity
    self + [self.reduce(:*)]
  end

  def pan_identity?
    identity.is_pandigital?
  end
end

def benchmark(n, &block)
  total = 0
  n.times do 
    before = Time.new
    yield
    after = Time.new
    total += after - before
  end
  total.to_f / n
end

solve = Proc.new do 
  ids = []
  (1..98).each do |a|
    upper = a < 10 ? 9876 : 987
    ((a + 1)..upper).each do |b|
      ids << [a, b].identity if [a, b].pan_identity?
    end
  end
  ids.map { |i| i[-1] }.uniq.reduce(:+)
end

puts "\nAnswer: #{solve.call}\n"


Benchmark.bm("solve:".length) do |x|
  x.report("solve:") { solve.call }
end
