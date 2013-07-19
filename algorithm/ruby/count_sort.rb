def count_sort(arr, range_s, range_e)
  count = []
  (range_e-range_s+1).times { count << 0 }
  arr.each do |val|
    count[val-range_s] += 1
  end
  1.upto(count.length-1) do |idx|
    count[idx] += count[idx-1]
  end
  result = []
  arr.reverse_each do |val|
    result[count[val-range_s]-1] = val
    count[val-range_s] -= 1
  end
  result
end

s = 3
e = 10
arr = [*s..e].shuffle.shuffle.shuffle

puts count_sort(arr, s, e).join(',')