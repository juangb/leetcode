# Definition for singly-linked list.
class ListNode
    attr_accessor :val, :next
    def initialize(val = 0, _next = nil)
        @val = val
        @next = _next
    end
end


def create_list()
	node1= ListNode.new(1)
	node2=ListNode.new(2)
	node3=ListNode.new(3)
	node4=ListNode.new(4)
	node5=ListNode.new(5)
	node6=ListNode.new(6)
	node1.next=node2
	node2.next=node3
	node3.next=node4
	node4.next=node5
	node5.next=node6
	return node1
end

def print_list(root)
	dummy = ListNode.new(0, root)
	puts dummy.val until (dummy = dummy.next).nil?
end