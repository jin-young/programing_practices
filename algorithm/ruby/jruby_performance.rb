# Illustrates the overhead of the JRuby <--> Java bridge
# parameter and return value type conversions, and the
# dramatic performance improvement that can be had by
# specifying the Java overload using java_method.

require 'java'
require 'benchmark'

ITERATION_COUNT = ARGV.empty? ? 100_000 : ARGV.first.to_i
JMath = java.lang.Math

# Test the max strategy, which is passed as a block taking x and y params.
def test
  ITERATION_COUNT.times do
    x = rand(1_000_000)
    y = rand(1_000_000)
    max = yield(x, y)
    max.class # do something w/max so Java optimizer doesn't eliminate it
  end
end

def java_test
  test { |x,y| java.lang.Math.max(x, y) }
end

def java_test_with_alias
  java_long_max = java.lang.Math.java_method(:max, [Java::long, Java::long])
  test { |x,y| java_long_max.(x, y) }
end

def java_test_with_math_alias
  test { |x,y| JMath.max(x, y) }
end

def ruby_test_inline
  test { |x, y| x >= y ? x : y }
end

def ruby_max(x, y)
  x >= y ? x : y
end

def ruby_test_with_function
  test { |x, y| ruby_max(x, y) }
end

def main
  iteration_count_str = java.text.NumberFormat.instance.format(ITERATION_COUNT)
  puts "Performing #{iteration_count_str} iterations for tests.\n"
  java_time               = Benchmark.measure { java_test }.real
  java_alias_time         = Benchmark.measure { java_test_with_alias }.real
  java_math_alias_time    = Benchmark.measure { java_test_with_math_alias }.real
  ruby_inline_time        = Benchmark.measure { ruby_test_inline }.real
  ruby_function_time      = Benchmark.measure { ruby_test_with_function }.real
  fastest_time            = [java_time, java_alias_time, java_math_alias_time, \
                            ruby_inline_time, ruby_function_time].min

  puts '%-24.24s%+16s%+16s%+16s' % ['', 'Total', 'Average', 'X / Min'] # header
  puts '%-24.24s%+16s%+16s%+16s' % ['', '(sec)', '(nsec)', '']

  output = ->(label, time) do
    average_time  = 1_000_000_000 * time / ITERATION_COUNT
    relative_time = time / fastest_time
    puts '%-24.24s%16.4f%16.4f%16.4f' % [label, time, average_time, relative_time]
  end

  output.('Using Java:',                 java_time)
  output.('Using Java w/alias:',         java_alias_time)
  output.('Using Java w/math alias:',    java_math_alias_time)
  output.('Using Ruby inline:',          ruby_inline_time)
  output.('Using Ruby w/function:',      ruby_function_time)
end

main