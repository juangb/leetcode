=begin

You need to find the largest value in each row of a binary tree.

Example:

Input: 

          1
         / \
        3   2
       / \   \  
      5   3   9 

Output: [1, 3, 9]

=end

# Definition for a binary tree node.
class TreeNode
    attr_accessor :val, :left, :right
    def initialize(val)
        @val = val
        @left, @right = nil, nil
    end
end

=begin
 Depth First Traversals
    Inorder Traversal (Left-Root-Right)
    Preorder Traversal (Root-Left-Right)
    Postorder Traversal (Left-Right-Root)
=end
# @param {TreeNode} root
# @return {Integer[]}
def depth_first_traversal(root)
	return if root.nil?
	#Traverse DFT (Cambiando el orden de estas 3 lo recorro inorder, preorder y postorder
	puts root.val
	depth_first_traversal(root.left)
	depth_first_traversal(root.right)
end


# @param {TreeNode} root
# @return {Integer[]}

def breadth_first_traversal(root,queue)
	return if root.nil?
	puts root.val
	queue.push(root.left) if !root.left.nil?
	queue.push(root.right) if !root.right.nil?
	while(!queue.empty?)
		breadth_first_traversal(queue.shift(),queue)
	end
end


# @param {TreeNode} node
# @param {Array} maxValues
# @param {Integer} depth
# @return {Integer[]}
def largest_values_recursive(node,maxValues,depth)
	return if node.nil?
	#Traverse DFT
	maxValues[depth] = node.val if maxValues[depth].nil? || node.val>maxValues[depth]
	largest_values_recursive(node.left,maxValues,depth+1)
	largest_values_recursive(node.right,maxValues,depth+1)
end

# @param {TreeNode} root
# @return {Integer[]}
def largest_values(root)
	maxValues=[]
	largest_values_recursive(root,maxValues,0)
	return maxValues
end

node1=TreeNode.new(1)
node2=TreeNode.new(3)
node3=TreeNode.new(2)
node4=TreeNode.new(5)
node5=TreeNode.new(3)
node6=TreeNode.new(9)
node1.left=node2
node1.right=node3
node2.left=node4
node2.right=node5
node3.right=node6

puts "DFT Preorder"
depth_first_traversal(node1)
puts "BFT"
breadth_first_traversal(node1,[])

puts largest_values(node1).to_s
