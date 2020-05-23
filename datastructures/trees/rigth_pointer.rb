=begin
Populating Next Right Pointers in Each Node

You are given a perfect binary tree where all leaves are on the same level, and every parent has two children. The binary tree has the following definition:

struct Node {
  int val;
  Node *left;
  Node *right;
  Node *next;
}

Populate each next pointer to point to its next right node. If there is no next right node, the next pointer should be set to NULL.

Initially, all next pointers are set to NULL.

 

Follow up:

    You may only use constant extra space.
    Recursive approach is fine, you may assume implicit queue space does not count as extra space for this problem.

 

Example 1:

Input: root = [1,2,3,4,5,6,7]
Output: [1,#,2,3,#,4,5,6,7,#]
Explanation: Given the above perfect binary tree (Figure A), your function should populate each next pointer to point to its next right node, just like in Figure B. The serialized output is in level order as connected by the next pointers, with '#' signifying the end of each level.

 

Constraints:

    The number of nodes in the given tree is less than 4096.
    -1000 <= node.val <= 1000

=end
load 'treeNode.rb'


###############################
# Approach 1. Inneficient. BFS with a queue
############################################
# @param {Node} root
# @return {Node}
def connect(root)
	return if root.nil?
	#Traverse BFS
	queue = [[root,1]]
	last_node = nil
	last_level = 0
	until queue.empty?
		node, level = queue.shift
		last_node.next = node if !last_node.nil? && last_level == level		
		puts node.val
		queue.push([node.left, level + 1]) unless node.left.nil?
		queue.push([node.right, level + 1]) unless node.right.nil?
		last_node = node
		last_level = level
	end
	root
end


##################################
# Approach 2. Much more space efficient. Traverse using pointer next
#################################
# @param {Node} root
# @return {Node}
def connect(root)	
	left_most = root
	until left_most.nil?
		node = left_most		
		until node.nil? || node.left.nil?
			node.left.next = node.right 
			node.right.next = node.next.left unless node.next.nil?
			node = node.next
		end
		left_most = left_most.left
	end
	root
end


node1=TreeNode.new(1)
node2=TreeNode.new(2)
node3=TreeNode.new(3)
node4=TreeNode.new(4)
node5=TreeNode.new(5)

node1.left=node2
node1.right=node3
node3.left=node4
node3.right=node5

connect(node1)


