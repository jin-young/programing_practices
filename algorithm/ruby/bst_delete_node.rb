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

def find_max_node(node)
  if node.right.nil?
    node
  else
    find_max_node(node.right)
  end
end

def delete_node(node, value)
  return nil if node.nil?

  if node.value == value
    if node.left.nil? and node.right.nil?
      node = nil
    elsif node.left.nil?
      node.right.parent = node
      node = node.right
    elsif node.right.nil?
      node.left.parent = node
      node = node.left
    else
      #final case. this node has two children
      max_node = find_max_node(node.left)
      node.left = delete_node(node.left, max_node.value)

      node.value = max_node.value
    end
  elsif node.value > value
    node.left = delete_node(node.left, value)
  else
    node.right = delete_node(node.right, value)
  end
  node
end

def print_tree(node)
  unless node.nil?
    print "#{node.value} "
    print_tree(node.left)

    print_tree(node.right)
  end
end

root = nil
#[6,3,1,4,5,9,8,7,11,2].each do |val|
[6,3,1,2,4,5,10,8,7,9,11].each do |val|
  if root
    insert_new_node(root, val)
  else
    root = Node.new(val)
  end
end

root = delete_node(root, 8)

print_tree(root)
puts