require 'prime'

class Integer
  def proper_divisors
    return [] if self == 1
    primes = prime_division.flat_map { |prime, freq| [prime] * freq }
    (1...primes.size).each_with_object([1]) do |n, result|
      primes.combination(n).each { |com| result << com.reduce(:*) }
    end.flatten.uniq
  end

  def abundant?
    proper_divisors.reduce(:+) > self
  end
end

limit = 28123
abundant_nums = (2..limit).select(&:abundant?)
sums = Array.new(limit + 1, false)

abundant_nums.each_with_index do |outer_num, i|
  abundant_nums[i..-1].each do |inner_num|
    sum = outer_num + inner_num
    break if sum > limit
    sums[sum] = true
  end
end

result = 0
sums.each_with_index do |can_be_written_as_abundant, i|
  result += i if !can_be_written_as_abundant
end
puts result

# 1. All positive multiples of abundant numbers are also abundant
# 2. All even numbers greater than 46 are the sum of two abundant numbers in at least one way


