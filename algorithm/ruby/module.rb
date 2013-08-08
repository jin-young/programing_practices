module Trig
  PI = 3.141592654
  def Trig.sin(x)
    puts "Sine of #{x}"
  end
  def Trig.cos(x)
    puts "Cosine of #{x}"
  end
end

class MyClass
  include Trig
end

m = MyClass.new
Trig.sin(100)