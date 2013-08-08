# This could be a problem, if concatenating of strings is very expensive like old java string +. (Since Java 5, string +
# will be converted into StringBuilder automatically by compiler, further more JIT translates it to faster native code,
# eventually). So does Ruby. Let use << instead of +.

def compress(str)
  result = ''
  prev_chr = nil
  count = 1
  return str if str.length <= 2

  str.split('').each do |chr|
    if prev_chr != chr
      result << prev_chr << count.to_s unless prev_chr.nil?
      prev_chr, count = chr, 1
    else
      count += 1
    end
    return str if result.length >= str.length-1
  end

  result << prev_chr << count.to_s
  result
end

puts compress('aabcccccaaa')
puts compress('a')
puts compress('ab')
puts compress('abc')
puts compress('aaa')