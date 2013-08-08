
def create_bst(arr)
  return nil if arr.nil? or arr.length == 0
  return Node.new(arr.first) if arr.length == 1

  mid_idx = arr.length / 2

  current = Node.new(arr[mid_idx])
  current.left = create_bst(arr[0...mid_idx])
  current.right = create_bst(arr[mid_idx+1..-1])

  return current
end

class Node
  attr_accessor :left, :right, :val
  def initialize(val)
    @val = val
    @left, @right = nil
  end
end

root = create_bst([1,2,3,4,5,6,7,8,9,10,11])
#root = create_bst([1,3,4,5,6,7,8])

queue = []
queue << root

def level_print(queue)
  new_queue = []
  r = queue.map do |node|
    new_queue << node.left if node.left
    new_queue << node.right if node.right
    node.val
  end
  puts r.join(' ')
  level_print(new_queue) unless new_queue.empty?
end

level_print(queue)