# If I can use auxiliary data structure like hash, I think I can do this one in O(n) time.
# Idea is this. First of all, walking first string from head to end. During the procedure,
# I'll gather how many each char appears in the string. Next, I'll walking second string
# from head to end. During the procedure, I'll subtract 1 from the hash, if current char is
# in the hash. If I find missing char or minus number, will return false.

def permutation?(str1, str2)
  counter = {}
  return false if str1.length != str2.length

  str1.split('').each do |chr|
    counter[chr] ||= 0
    counter[chr] += 1
  end

  str2.split('').each do |chr|
    return false if counter[chr].nil? or (counter[chr] == 0)
    counter[chr] -= 1
  end

  true
end

puts permutation?('dog','god')

puts permutation?('printer','irpnter')

puts permutation?('permutation?','permutetion?')