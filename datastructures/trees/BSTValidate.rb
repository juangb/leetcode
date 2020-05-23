=begin
Validate Binary Search Tree

Given a binary tree, determine if it is a valid binary search tree (BST).

Assume a BST is defined as follows:

    The left subtree of a node contains only nodes with keys less than the node's key.
    The right subtree of a node contains only nodes with keys greater than the node's key.
    Both the left and right subtrees must also be binary search trees.

 

Example 1:

    2
   / \
  1   3

Input: [2,1,3]
Output: true

Example 2:

    5
   / \
  1   4
     / \
    3   6

Input: [5,1,4,null,null,3,6]
Output: false
Explanation: The root node's value is 5 but its right child's value is 4.

=end
load 'treeNode.rb'
##############################################
#  Approach 3: Inorder traversal (With a stack)
##############################################
# @param {TreeNode} root
# @return {Boolean}
def is_valid_bst(root)	
	stack=[]
	current_node=root
	lastVal=-Float::INFINITY
	until current_node.nil? && stack.empty?
		until current_node.nil?
			stack.push(current_node)
			current_node=current_node.left		
		end
		if current_node.nil? && !stack.empty?
			node=stack.pop
			return false if node.val<=lastVal
			lastVal=node.val
			current_node=node.right
		end
	end
	return true
end


####################################################

def traverseDFS(root)
	return if root.nil?
	traverseDFS(root.left)	
	puts(root.val)
	traverseDFS(root.right)
	
end


#############################
def traverseDFSQueue(root)
	return if root.nil?
	stack=[]
	current_node=root	
	until current_node.nil? && stack.empty?
		until current_node.nil?
			stack.push(current_node)
			current_node=current_node.left		
		end
		if current_node.nil? && !stack.empty?
			node=stack.pop
			puts node.val
			current_node=node.right
		end
	end
end
###############################
# APPROACH 1 - RECURSIVE
###############################
def is_valid_bst_helper(root, upper_limit, lower_limit)	
	if root.nil?
		return true 
	elsif root.val>=upper_limit || root.val <= lower_limit
		return false
	else
		return is_valid_bst_helper(root.left,root.val,lower_limit) && is_valid_bst_helper(root.right,upper_limit,root.val)
	end
	return true
end

# @param {TreeNode} root
# @return {Boolean}
def is_valid_bst(root)	
	is_valid_bst_helper(root,Float::INFINITY, -Float::INFINITY)
end

node1=TreeNode.new(3)
node2=TreeNode.new(2)
node3=TreeNode.new(4)
node4=TreeNode.new(1)
node5=TreeNode.new(5)

node1.left=node2
node1.right=node3
node3.left=node4
node3.right=node5
traverseBFS(node1)
puts "queue"
traverseBFSQueue(node1)
puts is_valid_bst(node1)
