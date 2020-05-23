=begin
 Intersection of Two Linked Lists

Write a program to find the node at which the intersection of two singly linked lists begins.
=end


#######################
# Solution with two stacks O(n) space O(n) time
#######################
# @param {ListNode} headA
# @param {ListNode} headB
# @return {ListNode}
def getIntersectionNode(headA, headB)
	stack1 = []
	stack2 = []
	dummyA = ListNode.new(0, headA)
	stack1.push(dummyA) until (dummyA = dummyA.next).nil?
	dummyB = ListNode.new(0, headB)
	stack2.push(dummyB) until (dummyB = dummyB.next).nil?
	node1 = stack1.pop
	node2 = stack2.pop
	return nil unless node1 == node2
	until stack1.empty? || stack2.empty? 
		node1 = stack1.pop
		node2 = stack2.pop	
		return node1.next if node1 != node2	
	end
	if(node1 == node2)
		return node1
	else
		return nil 
	end
end



#########################
# Solution with a set. Slower. O(n) space
########################
require 'set'
def getIntersectionNode(headA, headB)
	node_set = Set.new
	nodeA = ListNode.new(0, headA)
	node_set.add(nodeA) until (nodeA = nodeA.next).nil?	
	nodeB = ListNode.new(0, headB)
	return headB if node_set.include?(headB) until (nodeB = nodeB.next).nil?	
	return nil
end

###########
# Two pointer solution. TODO
################
def getIntersectionNode(headA, headB)
	pointerA = ListNode.new(0,headA)
	pointerB = ListNode.new(0,headB)
	first_time_a = true
	first_time_b = true
	#Traverse
	until  pointerA.nil? || pointerB.nil?
		pointerA = pointerA.next
		pointerB = pointerB.next
		if pointerA.nil? && first_time_a
			pointerA = headB 
			first_time_a = false
		elsif pointerB.nil? && first_time_b
			pointerB = headA
			first_time_b = false
		end
		return pointerA if pointerA == pointerB
	end
	return nil
	
end





