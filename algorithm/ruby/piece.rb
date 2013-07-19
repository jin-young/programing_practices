def find_sum(upper_bound, *factors)
  (1...upper_bound).to_a.inject(0) do |sum, val|
    factors.any? { |f| val % f == 0 } ? sum + val : sum
  end
end


puts find_sum(10, 2, 3)