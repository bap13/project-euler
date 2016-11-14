require 'benchmark'

solve = Proc.new do
  two_three = []
  one_four = []

  (12..98).each do |a|
    (123..987).each do |b|
      product = a*b
      if product <= 9876 && product >= 1234
        two_three << "#{a}#{b}#{product}"
      end
    end
  end

  (1..9).each do |a|
    (1234..9876).each do |b|
      product = a*b
      if product <= 9876 && product >= 1234
        one_four << "#{a}#{b}#{product}"
      end
    end
  end

  result = (two_three + one_four).select do |str|
    (str !~ /([1-9]).*\1/) && (str !~ /[0]/)
  end

  result.map { |n| n[-4..-1].to_i }.uniq.reduce(:+)
end

puts "\nAnswer: #{solve.call}\n\n"

Benchmark.bm("solve:".length) do |x|
  x.report("solve:") { solve.call }
end
