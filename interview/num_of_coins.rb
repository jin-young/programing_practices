require 'java'

COINS = [25,10,6,1]

def biggest_coin(changes, coins)
  coins.find { |v| v <= changes  }
end

def min(a,b)
  a < b ? a : b
end

@cache = {}
def f(change, coins)
  return 0 if change == 0

  return @cache[change][coins] if @cache[change] and @cache[change][coins]

  biggest =  biggest_coin(change, coins)
  return Float::MAX if biggest.nil?

  num_of_coin1 = f(change - biggest, coins) + 1
  num_of_coin2 = f(change, coins[1..-1])

  new_min = min(num_of_coin1, num_of_coin2)
  @cache[change] ||= {}
  @cache[change][coins] = new_min
end

puts f(99, COINS)