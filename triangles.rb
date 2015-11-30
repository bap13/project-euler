def factors(n)
  factors = 0
  i = 1
  while( i**2 <= n ) 
    if n % i == 0
      factors += 2
    end
    i += 1
  end
  factors
end

n = 1
triangle_number = 0
while( factors(triangle_number) < 500 )
  triangle_number +=  n
  n += 1
end

puts triangle_number
