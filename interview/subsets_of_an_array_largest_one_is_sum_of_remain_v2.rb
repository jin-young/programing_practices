dir = File.expand_path(File.dirname(__FILE__))
arr = File.open(dir + '/numbers.csv') do |f|
  f.readline.strip.split(',').map(&:to_i)
end

def count_matched_subset(arr, target_val)
  return 0 if arr.empty?
  if arr.length == 1
    return arr.first != target_val ? 0 : 1
  end

  count = 0
  if target_val - arr.last == 0
    count = 1
  else
    new_arr = arr[0..-2].select {|v| v <= target_val - arr.last}
    count = count_matched_subset(new_arr, target_val - arr.last)
  end

  count += count_matched_subset(arr[0..-2], target_val)
end

#arr = [1,2,3,4] #=> 2
#arr = [1,2,3,4,10] #=> 3
#arr = [1,3,5,7,8] #=> 2
#arr = [1,3,5,10] #=> 0
count = 0
(arr.length-1).downto(0) do |idx|
  count += count_matched_subset(arr[0...idx],  arr[idx])
end

puts count