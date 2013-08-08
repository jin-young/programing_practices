require 'java'

dir = File.expand_path(File.dirname(__FILE__))
arr = File.open(dir + '/numbers.csv') do |f|
  f.readline.strip.split(',').map(&:to_i)
end

@count = 0
@checked = {}
def count_matched_subset(arr)
  return if arr.empty? or arr.length <= 2 or @checked[arr]

  if arr.last == arr[0...(arr.length-1)].inject(0) {|s,v|s+v}
    @count += 1
  end
  @checked[arr] = true

  0.upto(arr.length-1).each do |idx|
    new_arr = arr[0...idx] + arr[(idx+1)..-1]
    count_matched_subset(new_arr)
  end
end

count_matched_subset(arr)
puts @count