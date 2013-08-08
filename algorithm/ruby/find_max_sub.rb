def find(arr)
  max_if_ending_here = max_so_far = arr.first
  begin_temp = 0
  begin_idx = 0
  end_idx = 0

  [*1...arr.length].each do |idx|
    if max_if_ending_here < 0
      max_if_ending_here = arr[idx]
      begin_temp = idx
    else
      max_if_ending_here += arr[idx]
    end

    if max_if_ending_here >= max_so_far
      max_so_far = max_if_ending_here
      begin_idx = begin_temp
      end_idx = idx
    end
  end
  return arr[begin_idx..end_idx]
end

puts find([-2, 1, -3, 4, -1, 2, 1, -5, 4]).join(', ')
puts find([1,2,-10, 3,4,5]).join(', ')
puts find([-1,-1,-1,-1,2,-1,1]).join(', ')