def is_balanced(n)
  return 0 if n.nil? or n.leaf?

  left_h = n.left ? is_balanced(n.left) + 1 : 0
  right_h = n.right ? is_balanced(n.right) + 1 : 0

  return -9999999 if (left_h + right_h < 0) or (left_h - right_h).abs > 1

  [left_h, right_h].max
end

class Node
  attr_accessor :left, :right, :val

  def initialize(val)
    @val = val
  end

  def leaf?
    left.nil? and right.nil?
  end
end

@balanced1 = Node.new(5)
puts is_balanced(@balanced1) == 0

@balanced1.left = Node.new(3)
puts is_balanced(@balanced1) > 0

@balanced1.left.left = Node.new(1)
puts is_balanced(@balanced1) < 0

@balanced1.right = Node.new(9)
puts is_balanced(@balanced1) > 0

@balanced1.right.left = Node.new(7)
@balanced1.right.right = Node.new(15)
puts is_balanced(@balanced1) > 0

@balanced1.right.right.right = Node.new(25)
puts is_balanced(@balanced1) > 0

@balanced1.right.right.right.right = Node.new(45)
puts is_balanced(@balanced1) < 0

@balanced1.left.right = Node.new(4)
puts is_balanced(@balanced1) < 0

@balanced1.left.left.left = Node.new(1)
puts is_balanced(@balanced1) < 0

@balanced1.right.right.left = Node.new(13)
@balanced1.left.right.left = Node.new(0)
@balanced1.right.left.right = Node.new(8)
puts is_balanced(@balanced1) > 0