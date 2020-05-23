=begin
Remove Nth Node From End of List

Given a linked list, remove the n-th node from the end of list and return its head.

Example:

Given linked list: 1->2->3->4->5, and n = 2.

After removing the second node from the end, the linked list becomes 1->2->3->5.

Note:

Given n will always be valid.

Follow up:

Could you do this in one pass?
=end
load "list_node.rb"

###############################
# Two passes. No additional space
###############################

# @param {ListNode} head
# @param {Integer} n
# @return {ListNode}
def remove_nth_from_end2(head, n)
	#Compute length
	num_nodes=0
	node=head
	until node.nil?
		num_nodes += 1 
		node=node.next
	end	
	node=head	
	#Find and delete	
	if n==num_nodes #First node
		return head.next
	elsif n==1 #Last node
		(num_nodes-n-1).times  { node=node.next } 
		node.next = nil
	else #Delete node
		(num_nodes-n).times { node=node.next}
		node.val=node.next.val
		node.next=node.next.next
	end
	return head
end


############################
#  One pass using a stack
#############################
def remove_nth_from_end3(head, n)	
	node=head
	stack=[]
	until node.nil?
		stack.push(node)
		node=node.next
	end
	return head.next if stack.length == n #Remove first node
	(n+1).times {node = stack.pop} #Middle and last nodes
	node.next=node.next.next
	return head
end

#######################################
#   One pass. No additional space. Two pointers
######################################
def remove_nth_from_end(head, n)	
	node1 = node2 = head # Two pointers
	n.times do 
		return head.next if node2.next.nil?
		node2=node2.next
	end
	node1=node1.next until (node2=node2.next).nil?
			
	node1.next=node1.next.next #Remove node n
	return head
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

head = remove_nth_from_end(root,2)

until head.nil?
	puts head.val
	head=head.next
end