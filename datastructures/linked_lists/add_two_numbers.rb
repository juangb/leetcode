=begin
Add Two Numbers

You are given two non-empty linked lists representing two non-negative integers. The digits are stored in reverse order and each of their nodes contain a single digit. Add the two numbers and return it as a linked list.

You may assume the two numbers do not contain any leading zero, except the number 0 itself.

Example:

Input: (2 -> 4 -> 3) + (5 -> 6 -> 4)
Output: 7 -> 0 -> 8
Explanation: 342 + 465 = 807.

=end
load 'list_node.rb'
# @param {ListNode} l1
# @param {ListNode} l2
# @return {ListNode}
def add_two_numbers(l1, l2)
	dummy_head = curr = ListNode.new
	extra = 0
	until l1.nil? && l2.nil? && extra == 0
		l1_val = l1.nil? ? 0 : l1.val
		l2_val = l2.nil? ? 0 : l2.val
		sum = l1_val + l2_val + extra
		curr.next = ListNode.new(sum % 10)			
		extra = sum / 10		
		l1 = l1.next unless l1.nil?
		l2 = l2.next unless l2.nil?
		curr = curr.next		
	end
	return dummy_head.next
end

