big_triangle = []
IO.readlines('p067_triangle.txt').each do |line|
  row = line.split(' ').map(&:to_i)
  big_triangle << row  
end

def max_path_sum(triangle)
  depth = triangle.length - 1
  max = triangle[depth]

  while (depth > 0)
    max = triangle[depth - 1].map.with_index { |num, i| [num + max[i], num + max[i + 1]].max }
    depth -= 1
  end

  max
end

puts max_path_sum(big_triangle)
