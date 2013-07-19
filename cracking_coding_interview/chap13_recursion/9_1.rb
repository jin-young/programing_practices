# how_many_possible_ways
#   input : n >= 0
#   output : number of possible ways
#   #ending condition first
#   return 0 if n < 0
#   return n if n <= 2
#   #then intermediate step
#   how_many_possible_ways(n-1) + how_many_possible_ways(n-2) + how_many_possible_ways(n-3)

@cache = {}
@hit, @miss = 0, 0

def how_many_possible_ways(n)
  return 0 if n < 0
  return 1 if n == 0
  return n if n <= 2

  if @cache[n]
    @hit += 1
    return @cache[n]
  end

  @miss += 1
  @cache[n] = how_many_possible_ways(n-1) + how_many_possible_ways(n-2) + how_many_possible_ways(n-3)
end

puts "#{how_many_possible_ways(1)}, #{@hit}, #{@miss}, #{@hit+@miss}"
puts "#{how_many_possible_ways(6)}, #{@hit}, #{@miss}, #{@hit+@miss}"
puts "#{how_many_possible_ways(12)}, #{@hit}, #{@miss}, #{@hit+@miss}"
puts "#{how_many_possible_ways(24)}, #{@hit}, #{@miss}, #{@hit+@miss}"
puts "#{how_many_possible_ways(100)}, #{@hit}, #{@miss}, #{@hit+@miss}"

# what about time / space complexity?
# no cache version
# O(3**n)
# cache version
# O(n) because for one k <= n, calculation happens only one time.