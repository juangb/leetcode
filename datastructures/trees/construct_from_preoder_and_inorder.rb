=begin
Construct Binary Tree from Preorder and Inorder Traversal

Given preorder and inorder traversal of a tree, construct the binary tree.

Note:
You may assume that duplicates do not exist in the tree.

For example, given

preorder = [3,9,20,15,7]
inorder = [9,3,15,20,7]

Return the following binary tree:

    3
   / \
  9  20
    /  \
   15   7

=end
load 'treeNode.rb'
load 'in_order_traversal.rb'

#############
#Solution 1. Recursive
#################

# @param {Integer[]} preorder
# @param {Integer[]} inorder
# @return {TreeNode}
def build_tree(preorder, inorder)
	return nil if preorder.nil? || preorder.length == 0
	
	hash = inorder.map.with_index.to_h
	i=0
	build = -> (left, right) do
		return nil if left > right
		node = TreeNode.new(preorder[i])
		i += 1
		node.left = build.(left, hash[node.val] - 1)
		node.right = build.(hash[node.val] + 1, right)
		return node
	end
	return build.(0, inorder.length-1)
end


#root = build_tree([3,9,20,15,7], [9,3,15,20,7])
#puts inorder_traversal(root).to_s



