=begin
Convert Sorted Array to Binary Search Tree

Given an array where elements are sorted in ascending order, convert it to a height balanced BST.

For this problem, a height-balanced binary tree is defined as a binary tree in which the depth of the two subtrees of every node never differ by more than 1.

Example:

Given the sorted array: [-10,-3,0,5,9],

One possible answer is: [0,-3,9,-10,null,5], which represents the following height balanced BST:

      0
     / \
   -3   9
   /   /
 -10  5
=end
load "treeNode.rb"
load "BT_BFS.rb"


def addNodes(nums,startIndex, endIndex)
	return nil if startIndex>endIndex
	mid = (startIndex+endIndex)/2
	node=TreeNode.new(nums[mid])
	node.left=addNodes(nums,startIndex,mid-1)
	node.right=addNodes(nums,mid+1,endIndex)
	return node
end

# @param {Integer[]} nums
# @return {TreeNode}
def sorted_array_to_bst(nums)
	return addNodes(nums,0,nums.length-1)	
end

root=sorted_array_to_bst([-1,0,1,2])
puts level_order(root).to_s
