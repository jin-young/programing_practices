require './tree/bst.rb'

def find_lowest_common_ancestor(n1, n2)
  return n1 if n1 == n2
  p1, p2 = n1, n2

  while p1 != p2
    break if p1.parent.nil? or p2.parent.nil?
    p1 = p1.parent
    p2 = p2.parent
  end

  should_up_p1 = p1.parent.nil? ? false : true

  count == 0
  while not (p1.parent.nil? and p2.parent.nil?)
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