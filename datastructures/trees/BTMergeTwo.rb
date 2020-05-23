=begin
1305. All Elements in Two Binary Search Trees
Medium

Given two binary search trees root1 and root2.

Return a list containing all the integers from both trees sorted in ascending order.

 

Example 1:

Input: root1 = [2,1,4], root2 = [1,0,3]
Output: [0,1,1,2,3,4]

Example 2:

Input: root1 = [0,-10,10], root2 = [5,1,7,0,2]
Output: [-10,0,0,1,2,5,7,10]

Example 3:

Input: root1 = [], root2 = [5,1,7,0,2]
Output: [0,1,2,5,7]

Example 4:

Input: root1 = [0,-10,10], root2 = []
Output: [-10,0,10]

Example 5:

Input: root1 = [1,null,8], root2 = [8,1]
Output: [1,1,8,8]

 

Constraints:

    Each tree has at most 5000 nodes.
    Each node's value is between [-10^5, 10^5].

=end

# Definition for a binary tree node.
class TreeNode
    attr_accessor :val, :left, :right
    def initialize(val)
        @val = val
        @left, @right = nil, nil
    end
end


# @param {TreeNode} root1
# @param {TreeNode} root2
# @return {Integer[]}
def traverseTree(root)
	queue=[]	
	return if root.nil?
	queue.push(root)
	while(!queue.isEmpty?)
		node=queue.pop()
		queue.push(node.left) if !node.left.nil?
		queue.push
	end	
	get_all_elements(root1.left,nil)
	puts root1.val
	get_all_elements(root1.right,nil)
end


# @param {TreeNode} root1
# @param {TreeNode} root2
# @return {Integer[]}
def traverseTreeRecursive(root1,orderedList)	
	return if root1.nil?	
	traverseTreeRecursive(root1.left,orderedList)
	orderedList.push(root1.val)
	traverseTreeRecursive(root1.right,orderedList)
end


# @param {TreeNode} root1
# @param {TreeNode} root2
# @return {Integer[]}
def get_all_elements(root1, root2)
	orderedList1=[]
	orderedList2=[]
	traverseTreeRecursive(root1,orderedList1)
	return orderedList1 if root2.nil?
	traverseTreeRecursive(root2,orderedList2)
	return orderedList2 if root1.nil?
	puts orderedList1.to_s
	puts orderedList2.to_s
	#Traverse both ordered lists and create a new one with all elements ordered
	orderedList=[]
	i=0
	j=0
	while(i< orderedList1.length || j <orderedList2.length)
		if(j==orderedList2.length || (i<orderedList1.length && orderedList1[i]<=orderedList2[j]))
			orderedList.push(orderedList1[i])
			i += 1
		else
			orderedList.push(orderedList2[j])
			j += 1
		end
	end
	return orderedList
end

node1=TreeNode.new(2)
node2=TreeNode.new(1)
node3=TreeNode.new(4)
node1.left=node2
node1.right=node3

node4=TreeNode.new(1)
node5=TreeNode.new(0)
node6=TreeNode.new(3)
node4.left=node5
node4.right=node6


puts get_all_elements(node1,node4).to_s

