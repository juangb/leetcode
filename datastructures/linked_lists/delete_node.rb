=begin
Delete Node in a Linked List

Write a function to delete a node (except the tail) in a singly linked list, given only access to that node.

Given linked list -- head = [4,5,1,9], which looks like following:

 

Example 1:

Input: head = [4,5,1,9], node = 5
Output: [4,1,9]
Explanation: You are given the second node with value 5, the linked list should become 4 -> 1 -> 9 after calling your function.

Example 2:

Input: head = [4,5,1,9], node = 1
Output: [4,5,9]
Explanation: You are given the third node with value 1, the linked list should become 4 -> 5 -> 9 after calling your function.

 

Note:

    The linked list will have at least two elements.
    All of the nodes' values will be unique.
    The given node will not be the tail and it will always be a valid node of the linked list.
    Do not return anything from your function.
=end
load 'list_node.rb'
# puts "Val: #{node.val} Next: #{node.next}"

# @param {ListNode} node
# @return {Void} Do not return anything, modify node in-place instead.
def delete_node(node)	
	node.val =node.next.val
	node.next=node.next.next		
end

root= ListNode.new(4)
node5=ListNode.new(5)
node1=ListNode.new(1)
node9=ListNode.new(9)
root.next=node5
node5.next=node1
node1.next=node9

delete_node(root)

until root.nil?
	puts root.val
	root=root.next
end
	
	