=begin
  Merge Two Sorted Lists

Merge two sorted linked lists and return it as a new list. The new list should be made by splicing together the nodes of the first two lists.

Example:

Input: 1->2->4, 1->3->4
Output: 1->1->2->3->4->4
=end
load 'list_node.rb'

# @param {ListNode} l1
# @param {ListNode} l2
# @return {ListNode}
def merge_two_lists(l1, l2)	
	head=ListNode.new nil
	head2 = head
	until l1.nil? && l2.nil?
		if l1.nil?
			head.next = l2
			break
		elsif l2.nil?
			head.next=l1
			break
		elsif l1.val < l2.val
			head.next = l1
			head = head.next
			l1=l1.next
		else
			head.next = l2
			head = head.next
			l2 = l2.next
		end		
	end
	return head2.next
end