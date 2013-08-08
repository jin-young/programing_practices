# FindMagicIndex
#    input: sorted array "arr", start index "sidx", end index "eidx"
#    output: index value if exists, or nil
#  simple approach
#    iteration from 0 to length-1 => O(n)
#
#  binary search approach (recursive). O(ln n)
#    #ending condition first
#    return nil if arr.empty? or sidx > eidx
#    if sidx == eidx
#      return (arr[sidx] == sidx) ? sidx : nil
#    end
#sdix
#    magic = nil
#    mid_idx = (sidx + eidx)/2
#    return mid_idx if arr[mid_idx] == idx
#    magic = FindMagicIndex(arr, sidx, mid_idx)
#    unless magic
#      magic = FindMagicIndex(arr, mid_idx+1, eidx)
#    end
#    return magic


def FindMagicIndex(arr, sidx, eidx)
  return nil if arr.empty? or sidx > eidx
  if sidx == eidx
    return (arr[sidx] == sidx) ? sidx : nil
  end

  mid_idx = (sidx + eidx)/2
  if mid_idx > arr[mid_idx]
    FindMagicIndex(arr, mid_idx+1, eidx)
  elsif mid_idx < arr[mid_idx]
    FindMagicIndex(arr, sidx, mid_idx-1)
  else
    mid_idx
  end
end

arr = [1,2,3,4,6,7,8,9]  #=> nil
arr = [-1,1,3,5,6,7,8,9] #=> 1
arr = [-10,-1,0,2,3,4,6] #=> 6
puts FindMagicIndex(arr, 0, arr.length-1)