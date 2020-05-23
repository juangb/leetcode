=begin
Odd Even Linked List

Given a singly linked list, group all odd nodes together followed by the even nodes. Please note here we are talking about the node number and not the value in the nodes.

You should try to do it in place. The program should run in O(1) space complexity and O(nodes) time complexity.

Example 1:

Input: 1->2->3->4->5->NULL
Output: 1->3->5->2->4->NULL

Example 2:

Input: 2->1->3->5->6->4->7->NULL
Output: 2->3->6->7->1->5->4->NULL

Note:

    The relative order inside both the even and odd groups should remain as it was in the input.
    The first node is considered odd, the second node even and so on ...

=end
load 'list_node.rb'


def odd_even_list(head)
	return head if head.nil? || head.next.nil? || head.next.next.nil?
	
	dummy_head = n_odd = ListNode.new(0,head)
	dummy_head_even = n_even = ListNode.new(0,head.next)
		
	until head.nil?
		n_odd.next = head
		head = head.next
		n_even.next = head
		head = head.next unless head.nil?
		n_odd = n_odd.next
		n_even = n_even.next
	end
	n_odd.next = dummy_head_even.next
	return dummy_head.next
end



node = create_list
node = odd_even_list(node)
puts "Done"
print_list(node)


