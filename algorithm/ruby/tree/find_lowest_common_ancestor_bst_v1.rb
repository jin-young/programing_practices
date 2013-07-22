require_relative '../../../libs/ruby/bst'

# time complexity : avg O(ln n), worst O(n)

def find_lowest_common_ancestor(n1, n2)
  return n1 if n1 == n2
  p1, p2 = n1, n2

  while p1 != p2
    break if p1.parent.nil? or p2.parent.nil?
    p1 = p1.parent
    p2 = p2.parent
  end

  should_up_p1 = p1.parent.nil? ? false : true

  count = 0
  while not (p1.parent.nil? and p2.parent.nil?) and  p1 != p2
    p1 = p1.parent unless p1.parent.nil?
    p2 = p2.parent unless p2.parent.nil?
    count += 1
  end

  p1, p2 = n1, n2
  count.times do
    should_up_p1 ? p1 = p1.parent : p2 = p2.parent
  end

  while p1 != p2
    p1 = p1.parent
    p2 = p2.parent
  end

  return p1
end

val1, val2 = nil, nil
mode = 3

if mode == 1
  tree = Bst.new
  srand(Time.now.to_i)
  15.times do |count|
    v = rand(50)
    val1 = v if count == 6
    val2 = v if count > 6 and (not val1.nil?) and val2.nil?
    tree.insert(v)
  end
elsif mode == 2
  tree = Bst.build([15,14,42,3,32,44,1,7,27,40,20,28,41,31])
  val1 = 40
  val2 = 27
elsif mode == 3
  tree = Bst.build([*1..3000])
  val1 = 2999
  val2 = 3000
end

puts 'tree building is done'

#puts tree.to_s
node1 = tree.find(val1)
node2 = tree.find(val2)

puts
puts "Node 1: #{node1.value}, Nod2 2: #{node2.value}"
puts "LCA: #{find_lowest_common_ancestor(node1, node2).value}"