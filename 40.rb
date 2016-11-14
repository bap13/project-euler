limit = 1e6
digits = (0..6).map { |p| 10**p }

i = 0
const = ""
loop do
  i += 1
  const << i.to_s
  break if const.length >= limit
end

puts digits.map { |d| const[d - 1].to_i }.reduce(:*)
  
