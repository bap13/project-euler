def spiral_diagonal_sum(side_length)
  start = side_length**2
  sum = start
  cur = start
  dec = side_length - 1

  while (dec > 0)
    i = 0
    while (i < 4) 
      cur -= dec
      sum += cur
      i += 1 
    end
    dec -= 2
  end

  sum
end

puts spiral_diagonal_sum(1001)

