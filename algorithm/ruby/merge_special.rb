arr = [[10,14],[3,4],[0,1],[3,5],[8,13]]

# arr1 is null or always has earlier start time
def can_be_merged(arr1, arr2)
  return true if arr1.nil? or arr2.nil?
  return true if arr1[1] >= arr2[0]

  return false
end

def min(a, b)
  a > b ? b : a
end

def max(a, b)
  a > b ? a : b
end

def merge_two_periods(arr1, arr2)
  return arr2 if arr1.nil?
  return [arr1[0], max(arr1[1], arr2[1])]
end

def merge_sort(arr)
  if arr.length == 1
    return arr
  end

  mid = arr.length / 2
  left = merge_sort(arr[0...mid])
  right = merge_sort(arr[mid..-1])

  result = []
  while !left.empty? and !right.empty?
    prev_item = result.last
    if left.first[0] < right.first[0]
      item = left.shift
    else
      item = right.shift
    end

    if prev_item and can_be_merged(prev_item, item)
      start, finish = merge_two_periods(prev_item, item)
      prev_item[0] = start
      prev_item[1] = finish
    else
      result << item
    end
  end

  while !left.empty?
    prev_item = result.last
    item = left.shift

    if prev_item and can_be_merged(prev_item, item)
      start, finish = merge_two_periods(prev_item, item)
      prev_item[0] = start
      prev_item[1] = finish
    else
      result << item
    end
  end

  while !right.empty?
    prev_item = result.last
    item = right.shift

    if prev_item and can_be_merged(prev_item, item)
      start, finish = merge_two_periods(prev_item, item)
      prev_item[0] = start
      prev_item[1] = finish
    else
      result << item
    end
  end

  result
end

puts merge_sort(arr).map { |a| "(#{a[0]}, #{a[1]})" }.join(', ')