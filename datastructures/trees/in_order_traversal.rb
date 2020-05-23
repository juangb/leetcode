=begin
Binary Tree Inorder Traversal

Given a binary tree, return the inorder traversal of its nodes' values.

Example:

Input: [1,null,2,3]
   1
    \
     2
    /
   3

Output: [1,3,2]

Follow up: Recursive solution is trivial, could you do it iteratively?

=end

##############################
#   Recursive solution
##############################
def dfs(root, tree_array)
	return if root.nil?
	dfs(root.left, tree_array)
	tree_array.push(root.val)
	dfs(root.right, tree_array)	
end

# @param {TreeNode} root
# @return {Integer[]}
def inorder_traversal2(root)
	tree_array =[]
	dfs(root, tree_array)
	return tree_array
end

##################################
# Iterative solution
################################
load 'treeNode.rb'

# @param {TreeNode} root
# @return {Integer[]}
def inorder_traversal(root)
	return [] if root.nil?
	stack = []
	tree_array =[]
	until root.nil?
		stack.push root
		root = root.left
	end
	until stack.empty?
		node = stack.pop
		tree_array.push(node.val)
		node = node.right
		until node.nil?
			stack.push(node) 
			node = node.left			
		end
	end
	return tree_array
end

node = createTree
puts inorder_traversal(node).to_s




