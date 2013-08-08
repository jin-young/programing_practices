require_relative '../../../libs/ruby/bst'

mode = 2
if mode == 1
  tree = Bst.build([14,8,34,1,21,37,3,20,26,36,24,28,31])
  val1 = 24
  val2 = 36   # lca => 34
elsif mode == 2
  tree = Bst.build([*1..3000])
  val1 = 2998
  val2 = 3000  # lca => 2998
end

puts 'tree building is done'

# assume no duplicated value, input values exist in tree
# assume tree is not binary search tree and node does not have a link to its parent

# worst case running time O(n^2)

def exist?(node, val)
  return false if node.nil?
  return true if node.value == val
  exist?(node.left, val) or exist?(node.right, val)
end

def find_lowest_common_ancestor(node, val1, val2)
  return nil if node.nil?
  return node if node.value == val1 or node.value == val2

  left_val1 = exist?(node.left, val1)
  left_val2 = exist?(node.left, val2)

  if left_val1 == left_val2
    left_val1 ? find_lowest_common_ancestor(node.left, val1, val2) :
        find_lowest_common_ancestor(node.right, val1, val2)
  else
    node
  end
end

puts find_lowest_common_ancestor(tree.root, val1, val2).value