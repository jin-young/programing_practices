def is_prime(n, primes)
  primes.each do |p|
    break if p > Math.sqrt(n).to_i
    return false if n % p == 0
  end
  true
end

def sum_of_prime_divisor(n, primes)
  sum = 0
  primes.each do |p|
    break if p > Math.sqrt(n).to_i
    if n % p == 0
      sum += p
    end
  end
  sum
end

@fib1, @fib2, @fib = nil, nil, nil

def first_grater_prime(n, primes)
  @fib1 ||= 0
  @fib2 ||= 1
  @fib ||= 0
  while true
    @fib = @fib1 + @fib2
    if @fib > n and is_prime(@fib, primes)
      break
    end
    @fib1 = @fib2
    @fib2 = @fib
  end
  @fib
end

def build_primes(n)
  pris = []
  [*2..(n/2)].each do |candi|
    is_p = true
    pris.each do |p|
      break if p > Math.sqrt(candi).to_i
      if candi % p == 0
        is_p = false
        break
      end
    end
    pris << candi if is_p
  end
  pris
end

primes = build_primes(227000)
x = first_grater_prime(227000, primes)
puts "X: #{x}"
puts sum_of_prime_divisor(x+1, primes)