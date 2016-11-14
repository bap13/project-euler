coins = [1, 2, 5, 10, 20, 50, 100, 200]
target = 200
ways = [1] + [0] * target

coins.each do |coin|
  for i in (coin..target)
    ways[i] += ways[i - coin]
  end
end

puts ways[target]
