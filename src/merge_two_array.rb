a = [1,3,4,7,nil,nil,nil,nil]

b = [2,5,8,10]

def merge(arr1, arr2, num_of_nonempty)
  merge_idx = arr1.length-1
  idx1 = num_of_nonempty - 1
  idx2 = arr2.length - 1

  while idx1 >= 0 and idx2 >=0
    if arr1[idx1] > arr2[idx2]
      arr1[merge_idx] = arr1[idx1]
      merge_idx -= 1
      idx1 -= 1
    else
      arr1[merge_idx] = arr2[idx2]
      merge_idx -= 1
      idx2 -= 1
    end
  end

  while idx2 >= 0
    arr1[merge_idx] = arr2[idx2]
    idx2 -= 1
    merge_idx -= 1
  end
end

merge(a, b, 4)
puts a.join(', ')