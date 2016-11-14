def cycle_length(d)
  cycle = []
  remainder = 1
  while (true)
    remainder = (10 * remainder) % d
    break if cycle.include?(remainder)
    cycle << remainder
  end
  cycle.length
end
