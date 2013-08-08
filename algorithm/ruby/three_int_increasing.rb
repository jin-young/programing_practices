def find_three(arr)
  min_idx = 0
  max_idx = arr.length - 1

  smaller = []
  arr.length.times { smaller << -1 }
  #smaller[0] = -1

  larger = []
  arr.length.times { larger << -1 }
  #larger[max_idx] = -1

  [*1..(arr.length - 1)].each do |idx|
    if arr[idx] <= arr[min_idx]
      min_idx = idx
      smaller[idx] = -1
    else
      smaller[idx] = min_idx
    end
  end

  (arr.length-2).downto(0) do |idx|
    if arr[idx] >= arr[max_idx]
      max_idx = idx
      larger[idx] = -1
    else
      larger[idx] = max_idx
    end
  end

  0.upto(arr.length-1) do |idx|
    if smaller[idx] != -1 and larger[idx] != -1
      return [arr[smaller[idx]], arr[idx], arr[larger[idx]]]
    end
  end

  return []
end

def find_three2(arr)
  min_idx = 0
  max_idx = arr.length - 1

  smaller = []
  arr.length.times { smaller << -1 }
  #smaller[0] = -1

  larger = []
  arr.length.times { larger << -1 }
  #larger[max_idx] = -1

  [*1..(arr.length - 1)].each do |idx|
    if arr[idx] <= arr[min_idx]
      min_idx = idx
      smaller[idx] = -1
    else
      smaller[idx] = min_idx
    end
  end

  (arr.length-2).downto(0) do |idx|
    if arr[idx] <= arr[max_idx]
      max_idx = idx
      larger[idx] = -1
    else
      larger[idx] = max_idx
    end
  end

  0.upto(arr.length-1) do |idx|
    if smaller[idx] != -1 and larger[idx] != -1
      return [arr[smaller[idx]], arr[idx], arr[larger[idx]]]
    end
  end

  return []
end

puts find_three([12, 11, 10, 5, 6, 2, 30]).join(', ')
puts find_three2([12, 11, 10, 5, 6, 2, 30]).join(', ')