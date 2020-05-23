=begin
Reverse Linked List

Reverse a singly linked list.

Example:

Input: 1->2->3->4->5->NULL
Output: 5->4->3->2->1->NULL

Follow up:

A linked list can be reversed either iteratively or recursively. Could you implement both?
=end
load 'list_node.rb'

#################################
#  Iterative with O(n) extra space
#################################
# @param {ListNode} head
# @return {ListNode}
def reverse_list_iterative(head)
	return if head.nil?
	#Iteratively with a stack
	stack=[]
	until head.nil?
		stack.push(head) 
		head= head.next
	end
	new_head = node = stack.pop
	node.next = node = stack.pop until stack.empty?
	node.next = nil
	return new_head	
end

#######################
#  Iterative solution. O(1) space
#####################

def reverse_list2(head)
	prev = nil
	curr = head
	until curr.nil?
		next_temp = curr.next
		curr.next=prev
		prev=curr
		curr=next_temp		
	end
	return prev
end

####################
#  Recursive solution. O(n) space
######################
def reverse_list(node)
	return node if node.nil? || node.next.nil?
	next_node = reverse_list(node.next)
	node.next.next = node
	node.next = nil
	return next_node
end

root= ListNode.new(1)
node2=ListNode.new(2)
node3=ListNode.new(3)
node4=ListNode.new(4)
node5=ListNode.new(5)
root.next=node2
node2.next=node3
node3.next=node4
node4.next=node5

head =reverse_list(root)
#head = reverse_list_recursive(root)
#
puts "Traverse"
until head.nil?
	puts head.val
	head=head.next
end



