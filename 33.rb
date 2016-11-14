require 'bigdecimal'
require 'bigdecimal/util'

contains_zero = Proc.new { |f| f.any? { |n| n =~ /[0]/ } }

has_cancel = Proc.new { |f| f[0].match(/[#{f[1]}]/) }

cancel_nums = Proc.new do |f|
  c = f[0].scan(/[#{f[1]}]/)[0]
  f.flat_map { |n| n.sub(c, '') }
end

decimalize = Proc.new { |f| f.map(&:to_f).reduce(:/) }

curious = Proc.new do |f|
  decimalize.call(f) == decimalize.call(cancel_nums.call(f))
end
  
fractions = ("11".."99").to_a.combination(2)

answer = fractions.reject(&contains_zero)
                  .select(&has_cancel)
                  .select(&curious)
                  .map(&decimalize)
                  .map(&:to_d)
                  .reduce(:*)
                  .to_r
                  .denominator

puts answer
