=begin
Symmetric Tree

Given a binary tree, check whether it is a mirror of itself (ie, symmetric around its center).

For example, this binary tree [1,2,2,3,4,4,3] is symmetric:

    1
   / \
  2   2
 / \ / \
3  4 4  3

 

But the following [1,2,2,null,3,null,3] is not:

    1
   / \
  2   2
   \   \
   3    3

 

Follow up: Solve it both recursively and iteratively.
=end
load "treeNode.rb"

###################################
# SOLUTION 1. USING EXTRA O(n) Arraylist
####################################

def dfs(root,orderedArray, isLeftChild)
	return if root.nil?
	dfs(root.left, orderedArray, true)
	orderedArray.push([root.val, isLeftChild])
	dfs(root.right, orderedArray, false)
end

# @param {TreeNode} root
# @return {Boolean}
def is_symmetric2(root)	
	orderedArray=[]
	dfs(root,orderedArray, false)
	return false if orderedArray.length.even? && orderedArray.length>0
	for i in 0..orderedArray.length/2-1		
		return false if orderedArray[i][0]!= orderedArray[orderedArray.length-1-i][0] || orderedArray[i][1]== orderedArray[orderedArray.length-1-i][1]
	end
	return true
end


############################
# SIMPLE RECURSIVE SOLUTION
############################
def isMirror(root1, root2)
	if root1.nil? && root2.nil?
		return true 
	elsif root1.nil? || root2.nil? || root1.val!=root2.val
		return false
	else
		return isMirror(root1.left,root2.right) && isMirror(root1.right,root2.left)	
	end
end

# @param {TreeNode} root
# @return {Boolean}
def is_symmetric(root)	
	return true if root.nil?
	return isMirror(root.left,root.right)
end
