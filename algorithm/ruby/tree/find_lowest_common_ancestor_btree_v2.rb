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

# assume no duplicated value, input values might not exist in tree
# assume tree is not binary search tree and node does not have a link to its parent

def find_lowest_common_ancestor(node, val1, val2)
  return [node, true] if node.value == val1 and node.value == val2
end