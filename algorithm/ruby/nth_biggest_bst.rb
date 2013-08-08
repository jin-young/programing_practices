class Node
  attr_accessor :value, :parent, :left, :right
  def initialize(value, parent = nil)
    @value = value
    @parent = parent
    @left = nil
    @right = nil
  end
end

def insert_new_node(parent, value)
  if parent.value > value
    if parent.left
      insert_new_node(parent.left, value)
    else
      parent.left = Node.new(value, parent)
    end
  else
    if parent.right
      insert_new_node(parent.right, value)
    else
      parent.right = Node.new(value, parent)
    end
  end
end

arr = [6,3,1,2,4,5,10,8,7,9,11]
root = nil
arr.each do |val|
  if root
    insert_new_node(root, val)
  else
    root = Node.new(val)
  end
end

################ stack version #####################

#values = []
#
#def push_values(node, values)
#  unless node.left.nil?
#    values = push_values(node.left, values)
#  end
#  values << node.value
#  unless node.right.nil?
#    values = push_values(node.right, values)
#  end
#  values
#end
#
#push_values(root, values)
#values.shift(arr.length - 1)
#puts values.first

################ right first in-order version #####################

def nth_element(node, target, count)
  value = nil
  if node.right
    value, count = nth_element(node.right, target, count)
  end

  if count == target
    return [value, target]
  elsif count + 1 == target
    return [node.value, count + 1]
  else
    count += 1
  end

  if node.left
    value, count = nth_element(node.left, target, count)
  end

  return [value, count]
end

value, order = nth_element(root, 6, 0)
puts value