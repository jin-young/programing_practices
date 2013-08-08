#======================== unicode version ===========================

# first idea is using hash. Walking the given string from head to end, check the current char is in hash or not.
# if it is, return false or put the chr into hash.
# when we reach the end of string, we can determine the string consists of uniq chars or not.
# O(n) time, O(n) space if hash lookup and insertion take O(1)

def uniq?(str)
  checker = {}
  str.split('').each do |chr|
    return false if checker[chr]
    checker[chr] = true
  end
  true
end

puts uniq?('abc')
puts uniq?('implement')

# If I cannot use additional data structure, I'll perform sorting like merge sort,
# then walking the string from head to end and check each adjust chars are same or not.
# merge sort takes O(n ln n) time and O(n) space. So is overall performance.


#========================= ascii version ====================================

# we only need a 256 length of boolean array. Logic is almost same with above method.
# Overall performance is O(n) time and O(1) space.

# Then, why I did use hash for unicode version? In practice, large size of input string consists of number of duplicated
# chars. If we use an array for the logic, too much memory space is pre-occupied even thought they are not used.