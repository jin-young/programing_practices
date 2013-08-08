@dic = { 'go'=>true, 'ogle' => true, 'google' => true, 'is' => true,
         'awe' => true, 'awesome' => true , 'some' => true, 'a' => true}

2.upto(10) { |v| @dic['a'*v] = true }

@count = 0
@cache = {}

def split_into_words(word)
  return [word] if @dic[word]
  return [] if word == ''
  return @cache[word] if @cache[word]

  1.upto(word.length).each do |idx|
    @count += 1
    if @dic[word[0,idx]]
      words = split_into_words(word[idx, word.length])
      unless words.empty?
        return [word[0,idx]] + words
      end
    end
  end

  @cache[word] = []

  return []
end

puts split_into_words("googleisawesome").join(' ')
puts split_into_words("aaaaaaaaaaaaaab").join(' ')