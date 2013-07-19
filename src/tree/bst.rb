# This BST ignores duplicated value

class Node
  attr_accessor :value, :parent, :left, :right
  def initialize(value, parent = nil)
    @value = value
    @parent = parent
    @left = nil
    @right = nil
  end
end

class BST
  attr_accessor :root

  def insert(value, parent = @root)
    if @root.nil?
      @root = Node.new(value)
      return @root
    end

    return parent if parent.value == value

    if parent.value > value
      if parent.left
        insert(parent.left, value)
      else
        parent.left = Node.new(value, parent)
      end
    else
      if parent.right
        insert(parent.right, value)
      else
        parent.right = Node.new(value, parent)
      end
    end
  end

  def find(val, node = @root)
    return nil if node.nil?
    return node if node.val == val

    if node.val < val
      find(val, node.right)
    else
      find(val, node.left)
    end
  end

  def build(arr, make_new = true)
    @root = nil if make_new
    arr.each { |v| insert(v) }
  end

  def print

  end
end