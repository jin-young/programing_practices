def is_connected(s, t)
  return true if s == t

  s.visited = true

  s.neighbors.each do |neighbor|
    return true if neighbor.is_unvisited and is_connected(neighbor, t)
  end

  return false
end

class Node
  attr_accessor :neighbors, :val, :visited
  def initialize(val)
    @val = val
    @visited = false
    @neighbors = []
  end

  def is_unvisited
    not @visited
  end
end

nodes = []
nodes << Node.new(1)
nodes << Node.new(2)
nodes[0].neighbors << nodes[1]

puts is_connected(nodes[0], nodes[1])
nodes.each { |n| n.visited = false }

puts is_connected(nodes[1], nodes[0])
nodes.each { |n| n.visited = false }

nodes << Node.new(3)
nodes[1].neighbors << nodes[2]

puts is_connected(nodes[0], nodes[2])
nodes.each { |n| n.visited = false }

nodes << Node.new(4)
nodes[1].neighbors << nodes[3]
puts is_connected(nodes[0], nodes[3])
nodes.each { |n| n.visited = false }

puts is_connected(nodes[2], nodes[3])
nodes.each { |n| n.visited = false }

nodes[2].neighbors << nodes[0]

puts is_connected(nodes[2], nodes[3])
nodes.each { |n| n.visited = false }

nodes << Node.new(5)
puts is_connected(nodes[2], nodes[4])