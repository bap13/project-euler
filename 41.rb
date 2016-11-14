require 'prime'

(1..9).map do |n|
  (1..n).to_a
        .permutation
        .map(&:join)
        .map(&:to_i)
        .select(&:prime?)
end
