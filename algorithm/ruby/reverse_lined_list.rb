class Node
  attr_accessor :val, :next
  def initialize(val)
    @val = val
    @next = nil
  end
end

head = Node.new(1)
current = head
[3,5,7,9].each do |v|
  current.next = Node.new(v)
  current = current.next
end

def reverse_linked_list(head)
  return head if head.nil? or head.next.nil?

  second = head.next
  third = second.next

  head.next = nil
  second.next = head

  return second if third.nil?

  current = third
  prev = second
  while !current.nil?
    next_node = current.next
    current.next = prev

    prev= current
    current = next_node
  end

  prev
end

new_head = reverse_linked_list(head)

node = new_head
while not node.nil?
  puts node.val
  node = node.next
end