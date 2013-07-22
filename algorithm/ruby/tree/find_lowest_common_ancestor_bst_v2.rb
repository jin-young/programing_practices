require_relative '../../../libs/ruby/bst'

# space for auxiliary data structure: none
# time complexity : avg O(ln n), worst O(n)

def find_lowest_common_ancestor(val1, val2, node)
  high = [val1, val2].max
  low = (val1 + val2) - high

  return nil if node.nil?

  if node.value < low
    return find_lowest_common_ancestor(high, low, node.right)
  elsif node.value > high
    return find_lowest_common_ancestor(high, low, node.left)
  else
    return node
  end
end

srand(Time.now.to_i)
val1, val2 = nil, nil

mode = 3

if mode == 1
  tree = Bst.new
  15.times do |count|
    v = rand(50)
    val1 = v if count == 6
    val2 = v if count > 6 and (not val1.nil?) and val2.nil?
    tree.insert(v)
  end
elsif mode == 2
  tree = Bst.build([28,23,36,18,26,34,47,1,33,43,8,45,7,11])
  val1 = 26
  val2 = 1
elsif mode == 3
  tree = Bst.build([*1..3000])
  val1 = 2999
  val2 = 3000
end

puts 'tree building is done'

puts "Node 1: #{val1}, Nod2 2: #{val2}"
puts "LCA: #{find_lowest_common_ancestor(val1, val2, tree.root).value}"