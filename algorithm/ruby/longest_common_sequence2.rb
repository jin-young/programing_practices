@cache = {}

def lcs(arr1, arr2, idx1=0, idx2=0, result=[])
  return result if idx1 == arr1.length or idx2 == arr2.length

  if @cache[idx1] and @cache[idx1][idx2]
    puts "Hit #{idx1},#{idx2}:#{@cache[idx1][idx2].join}"
    return @cache[idx1][idx2] unless @cache[idx1][idx2].empty?
  end

  temp_res1, temp_res2 = nil, nil

  # if current char at idx1 in arr1 is a part of subseq
  if arr1[idx1] == arr2[idx2]
    temp_res1 = lcs(arr1, arr2, idx1+1, idx2+1, result + arr1[idx1..idx1])
  else
    temp_res1 = lcs(arr1, arr2, idx1, idx2+1, result)
  end

  # else
  temp_res2 = lcs(arr1, arr2, idx1+1, idx2, result)

  # finally
  @cache[idx1] ||= {}
  if temp_res1.length > temp_res2.length
    @cache[idx1][idx2] = temp_res1
  else
    @cache[idx1][idx2] = temp_res2
  end
  puts "Miss #{idx1},#{idx2}:#{@cache[idx1][idx2].join}"
  @cache[idx1][idx2]
end

#arr1 = 'ACCGGTCGAGTGCGCGGAAGCCGGCCGAA'.split('')
#arr2 = 'GTCGTTCGGAATGCCGTTGCTCTGTAAA'.split('')

arr1 = 'ABCD'.split('')
arr2 = 'BCDF'.split('')

puts lcs(arr1, arr2).join