=begin
Palindrome Linked List

Given a singly linked list, determine if it is a palindrome.

Example 1:

Input: 1->2
Output: false

Example 2:

Input: 1->2->2->1
Output: true

Follow up:
Could you do it in O(n) time and O(1) space?
=end
load 'list_node.rb'

#################
# O(n) time and O(1) space
# I will reverse half of the list and check if it's equal than the other half
# Note: Instead of counting the elements i could have used two pointers, 
# one goint twice as fast as the other to find the middle element
###################

# @param {ListNode} head
# @return {Boolean}
def is_palindrome(head)
	return true if head.nil? || head.next.nil? #TODO Check later if this is necessary
	first = last = head
	#Count number of items
	n = 1
	until last.next.nil?
		n += 1
		last = last.next 
	end
	#Reverse half of the list
	prev = nil
	curr = head
	(n/2).times do
		temp = curr.next
		curr.next = prev
		prev = curr
		curr = temp
	end
	head1 = prev
	head2 = curr
	head2 = head2.next if n.odd?	
	#Check that both sublists are equal
	until head1.nil? || head2.nil?
		return false unless head1.val == head2.val
		head1 = head1.next
		head2 = head2.next
	end
	return true	
end

###############################
# Tests
################################
root= ListNode.new(1)
node2=ListNode.new(2)
node3=ListNode.new(3)
node4=ListNode.new(4)
node5=ListNode.new(5)
root.next=node2
node2.next=node3
node3.next=node4
node4.next=node5

head1, head2 = is_palindrome(root)

puts "Traverse1"
until head1.nil?
	puts head1.val
	head1=head1.next
end

puts "Traverse2"
until head2.nil?
	puts head2.val
	head2=head2.next
end



