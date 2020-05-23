=begin
104. Maximum Depth of Binary Tree
Easy

Given a binary tree, find its maximum depth.

The maximum depth is the number of nodes along the longest path from the root node down to the farthest leaf node.

Note: A leaf is a node with no children.

Example:

Given binary tree [3,9,20,null,null,15,7],

    3
   / \
  9  20
    /  \
   15   7

return its depth = 3.
=end

# Definition for a binary tree node.
class TreeNode
    attr_accessor :val, :left, :right
    def initialize(val)
        @val = val
        @left, @right = nil, nil
    end
end

# @param {TreeNode} root
# @return {Integer}
def max_depth(root)
	return 0 if root.nil?
	#BFS Queue + depthcount
	queue =[]
	depth=1
	queue.push([root,1])
	until(queue.empty?)
		node, node_depth = queue.shift()
		depth = node_depth if node_depth > depth
		queue.push([node.left,node_depth+1]) unless node.left.nil?
		queue.push([node.right,node_depth+1]) unless node.right.nil?
	end
	return depth
end



