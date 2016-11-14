class Integer
  def pandigital?
    digits = []
    n = self
    len = 0
    while n > 0
      len += 1
      d = n % 10
      return false if d == 0 || digits[d]
      digits[d] = true
      n /= 10
    end
    digits[1..len].all?
  end
end

