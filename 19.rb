def is_leap?(year)
  (year % 4 == 0 && year % 100 != 0) || (year % 400 == 0)
end

def days_in_month(year)
  if is_leap?(year)
    return [31, 29, 31, 30, 31, 30, 31, 31, 30, 31, 30, 31]
  end
  [31, 28, 31, 30, 31, 30, 31, 31, 30, 31, 30, 31]
end

def is_sunday?(day)
  day % 7 == 0
end

year = 1901
end_year = 2000
day = 3 # 1 represents Monday, 2 => Tuesday, etc.
first_sundays = 0

while (year <= end_year)
  days_in_month(year).each do |days|
    first_sundays += 1 if is_sunday?(day)
    day += days
  end
  year += 1
end

puts first_sundays
