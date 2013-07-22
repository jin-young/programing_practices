# This BST ignores duplicated value

class Node
  attr_accessor :value, :parent, :left, :right
  def initialize(value, parent = nil)
    @value = value
    @parent = parent
    @left = nil
    @right = nil
  end

  def is_leaf?
     left.nil? and right.nil?
  end
end

class Bst
  attr_accessor :root

  def self.build(arr, balance = false)
    tree = Bst.new
    if balance
    else
      arr.each { |v| tree.insert(v) }
    end
    tree
  end

  def insert(value, node = root)
    if node.nil?
      node = Node.new(value)
      @root = node if @root.nil?
      return node
    end

    return node if node.value == value

    if node.value > value
      node.left = insert(value, node.left)
      node.left.parent = node
    else
      node.right = insert(value, node.right)
      node.right.parent = node
    end

    node
  end

  def find(val, node = root)
    return nil if node.nil?
    return node if node.value == val

    if node.value < val
      find(val, node.right)
    else
      find(val, node.left)
    end
  end

  def build(arr, make_new = true)
    @root = nil if make_new
    arr.each { |v| insert(v) }
  end

  def to_a(node = root)
    return [] if node.nil?
    return [node.value] if node.is_leaf?
    to_a(node.left) + [node.value] + to_a(node.right)
  end

  def to_s
    return '' if root.nil?

    queue = [root]
    str = ''
    while not queue.empty?
      new_queue = []
      str += queue.map do |n|
        if n.instance_of? Node
          new_queue << (n.left ? n.left : '*' )
          new_queue << (n.right ? n.right : '* ')
          n.value
        else
          '*'
        end
      end.join('  ') + "\n"
      queue = new_queue
    end
    str
  end
end