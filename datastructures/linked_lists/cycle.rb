=begin
Linked List Cycle

Given a linked list, determine if it has a cycle in it.

To represent a cycle in the given linked list, we use an integer pos which represents the position (0-indexed) in the linked list where tail connects to. If pos is -1, then there is no cycle in the linked list.

 

Example 1:

Input: head = [3,2,0,-4], pos = 1
Output: true
Explanation: There is a cycle in the linked list, where tail connects to the second node.

Example 2:

Input: head = [1,2], pos = 0
Output: true
Explanation: There is a cycle in the linked list, where tail connects to the first node.

Example 3:

Input: head = [1], pos = -1
Output: false
Explanation: There is no cycle in the linked list.

 

Follow up:

Can you solve it using O(1) (i.e. constant) memory?

=end

# @param {ListNode} head
# @return {Boolean}
def hasCycle_long(head)
	return false if head.nil?
	node1 = head
	node2 = head.next
	until node2.nil?
		return true if node1 == node2
		node1 = node1.next
		return false if node2.next.nil?
		node2 = node2.next.next
	end
	return false
end

def hasCycle(head)	
	node1 = node2 = head	
	return true if (node1 = node1.next) == (node2 = node2.next.next) until node2.nil? || node2.next.nil?	
	return false
end

