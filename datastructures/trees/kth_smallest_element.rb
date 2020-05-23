=begin
Kth Smallest Element in a BST

Given a binary search tree, write a function kthSmallest to find the kth smallest element in it.

Note:
You may assume k is always valid, 1 ≤ k ≤ BST's total elements.

Example 1:

Input: root = [3,1,4,null,2], k = 1
   3
  / \
 1   4
  \
   2
Output: 1

Example 2:

Input: root = [5,3,6,2,4,null,null,1], k = 3
       5
      / \
     3   6
    / \
   2   4
  /
 1
Output: 3

Follow up:
What if the BST is modified (insert/delete operations) often and you need to find the kth smallest frequently? How would you optimize the kthSmallest routine?

=end
load 'treeNode.rb'

# @param {TreeNode} root
# @param {Integer} k
# @return {Integer}
def kth_smallest(root, k)	
	count = 0
	val = nil
	traverse = -> (node) do
		return nil if node.nil? 		
		traverse.(node.left)
		count += 1		
		val = node.val if count == k
		traverse.(node.right)
	end
	traverse.(root)
	val
end

node = createTree
puts kth_smallest(node, 2)

