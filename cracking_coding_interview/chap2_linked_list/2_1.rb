# my first approach is using Hash. Every time I visit a node, I'll check the node value exists in the Hash.
# if exist I'll delete current node. If not. I'll put the value into the hash and move to next.
# This will take O(n) time and O(n) space.

class Node
  attr_accessor :next, :val
  def initialize(val)
    self.val = val
  end
end

def delete_dup(head)
  seen = {}
  prev, current = head, head
  while(current != nil)
    if(seen[current.val])
      prev.next = current.next
      current = current.next
    else
      seen[current.val] = true
      prev = current
      current = current.next
    end
  end
end

head, current = nil, nil
[1,2,3,4,2,5,6,4,7,8,9,3].each do |v|
  if current.nil?
    head = current = Node.new(v)
  else
    current.next = Node.new(v)
    current = current.next
  end
end

def checklist(head)
  while(head != nil)
    print "#{head.val} "
    head = head.next
  end
  puts ''
end

delete_dup(head)
checklist(head)


# If I cannot use temporary buffer......