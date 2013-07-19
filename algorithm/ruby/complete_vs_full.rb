class Node
  attr_accessor :value, :parent, :left, :right, :is_leaf
  def initialize(value, parent = nil)
    @value = value
    @parent = parent
    @left = nil
    @right = nil
    @is_leaf = true
  end
end

def insert_new_node(parent, value)
  if parent.value > value
    if parent.left
      insert_new_node(parent.left, value)
    else
      parent.left = Node.new(value, parent)
      parent.is_leaf = false
    end
  else
    if parent.right
      insert_new_node(parent.right, value)
    else
      parent.right = Node.new(value, parent)
      parent.is_leaf = false
    end
  end
end

def build_tree(arr)
  root = nil
  arr.each do |val|
    if root
      insert_new_node(root, val)
    else
      root = Node.new(val)
    end
  end
  root
end

def gather_tree_info(node, height=0)
  if node.nil?
    return [0,0]
  end

  if node.is_leaf
    return [height, 1]
  else
    left_h, num_of_left = gather_tree_info(node.left, height+1)
    right_h, num_of_right = gather_tree_info(node.right, height+1)
    height = left_h > right_h ? left_h : right_h
    num_of_node = num_of_left + num_of_right + 1
  end

  return [height, num_of_node]
end

def is_full(node)
  return true if node.is_leaf

  if node.left and node.right
    return is_full(node.left) & is_full(node.right)
  end

  false
end

def is_complete(root)
  return true unless root

  queue = []
  queue << root
  flag = false
  while not queue.empty?
    node = queue.shift
    if(node.left)
      return false if flag
      queue << node.left
    else
      flag = true
    end

    if(node.right)
      return false if flag
      queue << node.right
    else
      flag = true
    end
  end

  true
end

def check_all(root)
  h, n = gather_tree_info(root)
  puts n == 2**(h+1) - 1 ? 'Perfect' : 'Not perfect'
  puts is_full(root) ? 'Full' : 'Not Full'
  puts is_complete(root) ? 'Complete' : 'Not complete'
end

puts 'Case 1'
check_all(build_tree([6,3,1,2,4,5,10,8,7,9,11]))
puts ''

puts 'Case 2'
check_all(build_tree([6,3,1,4,10,8,11]))
puts ''

puts 'Case 3'
check_all(build_tree([6,3,1,4,10,8,11,7,9]))
puts ''

puts 'Case 4'
check_all(build_tree([2,1,3]))
puts ''

puts 'Case 5'
check_all(build_tree([3,2,1,4]))
puts ''

puts 'Case 6'
check_all(build_tree([4,2,1,3,6,5]))
puts ''

puts 'Case 7'
check_all(build_tree([2,1,4,3,5]))
puts ''

puts 'Case 8'
check_all(build_tree([4,2,3,6,5,7]))
puts ''

puts 'Case 9'
check_all(build_tree([6,5,3,2,4,10,8,7,9,12,11,13]))
puts ''

puts 'Case 10'
check_all(build_tree([6,4,5,2,1,3,10,8,12]))
puts ''