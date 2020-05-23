=begin
Binary Tree Level Order Traversal

Given a binary tree, return the level order traversal of its nodes' values. (ie, from left to right, level by level).

For example:
Given binary tree [3,9,20,null,null,15,7],

    3
   / \
  9  20
    /  \
   15   7

return its level order traversal as:

[
  [3],
  [9,20],
  [15,7]
]
=end
load "treeNode.rb"


# @param {TreeNode} root
# @return {Integer[][]}
def level_order(root)
    return [] if root.nil?
	traversalArray=[]
	queue=[]
	queue.push([root,0])
	until queue.empty?
		node, level=queue.shift
		traversalArray[level]=[] if traversalArray[level].nil?
		traversalArray[level].push(node.val)
		queue.push([node.left, level+1]) unless node.left.nil?
		queue.push([node.right, level+1]) unless node.right.nil?
	end
	return traversalArray
end


