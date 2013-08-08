def permute(arr)
  return arr if arr.length == 1

  result = []
  arr.each_with_index do |chr, idx|
    new_arr = arr[0...idx] + arr[idx+1..-1]
    sub_result = permute(new_arr)
    sub_result.each do |new_str|
      result << chr + new_str
    end
  end
  result
end


puts permute('dogs'.split(''))