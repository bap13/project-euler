def prime_sieve(n)
  bool_array = Array.new(n + 1, true)
  bool_array[0] = bool_array[1] = false
  prime_array = ''

  for i in 2..Math.sqrt(n).ceil
    if bool_array[i]
      j = 0
      while((i**2 + j*i) <= n)
        bool_array[(i**2 + j*i)] = false
        j += 1
      end
    end
  end
  bool_array.each_index.select { |i| bool_array[i] == true }
end

def prime_factors(number)
  prime_array = prime_sieve(1_000_000)
  factors = prime_array.each.select { |n| number % n == 0 }
  factors
end

def prime_summation
  prime_sieve(2_000_000).reduce(:+)
end

