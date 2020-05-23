=begin
Binary Tree Zigzag Level Order Traversal

Given a binary tree, return the zigzag level order traversal of its nodes' values. (ie, from left to right, then right to left for the next level and alternate between).

For example:
Given binary tree [3,9,20,null,null,15,7],

    3
   / \
  9  20
    /  \
   15   7

return its zigzag level order traversal as:

[
  [3],
  [20,9],
  [15,7]
]
=end
##########################
# BFS and invert even lines
#############################

# @param {TreeNode} root
# @return {Integer[][]}
def zigzag_level_order(root)
	return [] if root.nil?
	traversal=[]
	queue = [[root, 0]]
	until queue.empty?
		node, level = queue.shift
		traversal[level] = [] if traversal[level].nil?
		level.even? ? traversal[level].push(node.val) : traversal[level].unshift(node.val)
		queue << [node.left, level + 1] unless node.left.nil?
		queue << [node.right, level + 1] unless node.right.nil?
	end
	return traversal
end






