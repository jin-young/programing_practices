@nodes = {}

def create_bst(arr, parent = nil)
  return nil if arr.nil? or arr.length == 0
  if arr.length == 1
    n = Node.new(arr.first, parent)
    @nodes[arr.first] = n
    return n
  end

  mid_idx = arr.length / 2

  current = Node.new(arr[mid_idx], parent)
  @nodes[arr[mid_idx]] = current

  current.left = create_bst(arr[0...mid_idx], current)
  current.right = create_bst(arr[mid_idx+1..-1], current)

  return current
end

class Node
  attr_accessor :left, :right, :val, :parent
  def initialize(val, parent = nil)
    @val = val
    @left, @right = nil
    @parent= parent
  end

  def next
    right.nil? ? first_large_parent : left_most_child
  end

  private

  def first_large_parent(n=parent)
    n = n.parent while n and n.val < val
    n
  end

  def left_most_child(n=right)
    n = n.left while not n.left.nil?
    n
  end
end

create_bst([1,2,3,4,5,6,7,8,9,10,11,12])

1.upto(11) do |v|
  puts v+1 == @nodes[v].next.val
end
puts @nodes[12].next.nil?