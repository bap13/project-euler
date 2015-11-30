def big_palindrome
  largest_palindrome = 0
  largest_so_far = 0
  (0..999).each do |i|
    (0..999).each do |j|
      product = i * j
      largest_so_far = product if palindrome?(product)
    end
    largest_palindrome = largest_so_far if (largest_so_far > largest_palindrome)
  end
  largest_palindrome
end

def palindrome?(n)
  return true if n.to_s == n.to_s.reverse
end
