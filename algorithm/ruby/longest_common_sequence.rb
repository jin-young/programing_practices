def max(a, b)
  a > b ? a : b
end

def lcs_length_only(arr1, idx1, arr2, idx2, cache = {})
  return 0 if idx1 == -1 or idx2 == -1
  return cache[[idx1, idx2]] if cache[[idx1,idx2]]

  if arr1[idx1] == arr2[idx2]
    len = lcs_length_only(arr1, idx1-1, arr2, idx2-1, cache) + 1
  else
    len = max(
        lcs_length_only(arr1, idx1-1, arr2, idx2, cache),
        lcs_length_only(arr1, idx1, arr2, idx2-1, cache)
    )
  end

  cache[[idx1, idx2]] = len
end

def lcs_with_map(arr1, arr2, map)
  0.upto(arr1.length - 1) do |col|
    col = col+1
    0.upto(arr2.length - 1) do |row|
      row = row+1
      if arr1[col-1] == arr2[row-1]
        map[row][col] = map[row-1][col-1] + 1
      else
        map[row][col] = max(map[row-1][col], map[row][col-1])
      end
    end
  end
  map[arr2.length][arr1.length]
end

def get_map(row, col)
  map = []
  row.times do |r|
    row_arr = []
    col.times do |c|
      if r == 0 || c == 0
        row_arr << 0
      else
        row_arr << nil
      end
    end
    map << row_arr
  end
  map
end

def lcs_seq(map, arr1, arr2, idx1=arr1.length, idx2=arr2.length)
  return '' if idx1 == 0 or idx2 == 0
  if arr1[idx1-1] == arr2[idx2-1]
    return lcs_seq(map, arr1, arr2, idx1-1, idx2-1) + arr1[idx1-1]
  else
    if map[idx2-1][idx1] > map[idx2][idx1-1]
      return lcs_seq(map, arr1, arr2, idx1, idx2-1)
    else
      return lcs_seq(map, arr1, arr2, idx1-1, idx2)
    end
  end
end

#arr1 = 'ABCDEFG'.split('')
#arr2 =  'BCDGK'.split('')
arr1 = 'ACCGGTCGAGTGCGCGGAAGCCGGCCGAA'.split('')
arr2= 'GTCGTTCGGAATGCCGTTGCTCTGTAAA'.split('')
puts lcs_length_only(arr1, arr1.length - 1, arr2, arr2.length - 1)

map = get_map(arr2.length+1, arr1.length+1)
puts lcs_length_only(arr1, arr1.length - 1, arr2, arr2.length - 1)
puts lcs_with_map(arr1, arr2, map)
puts lcs_seq(map, arr1, arr2)