def divisors(n)
  div = []
  2..(n/2).each do |i|
    div << factor if n % i == 0

end
