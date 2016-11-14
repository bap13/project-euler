require 'set'

p_set = Set.new
i = 0

loop do
  i += 1
  p = i*(3*i - 1) / 2
  p_set.add(p)
  break unless for n in p_set
    if p_set.include?(p - n) && p_set.include?(p - 2*n)
      puts p - 2*n
      break
    end
  end
end

