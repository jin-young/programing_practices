# Every positive integer can be uniquely written as a sum of terms of the Fibonacci sequence.
# Fibonacci: [ 1, 1, 2, 3, 5, 8, 13, ...]
# For example, 100 = 3 + 8 + 89.
# Such a sum is called the Zeckendorf representation of the number.
#
# For any integer n>0, let z(n) be the number of terms in the Zeckendorf representation of n.
#
# 14 = 13 + 1  ==> z(14) = 2
#
# Task: Given n, find z(n)

def biggest_fibonacci(n)
  fib1 = 1
  fib2 = 1
  fib = fib1+fib2
  while fib <= n
    fib1 = fib2
    fib2 = fib

    if fib1 + fib2 > n
      break
    else
      fib = fib1 + fib
    end
  end
  fib
end

def z(n)
  count = 0
  bigs = []
  while(n > 0)
    bigs << biggest_fibonacci(n)
    n -=  bigs.last
    count += 1
  end
  puts bigs.join(',')
  count
end

puts z(99999999999)