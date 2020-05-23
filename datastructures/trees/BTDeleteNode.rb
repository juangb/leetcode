=begin
450. Delete Node in a BST
Medium

Given a root node reference of a BST and a key, delete the node with the given key in the BST. Return the root node reference (possibly updated) of the BST.

Basically, the deletion can be divided into two stages:

    Search for a node to remove.
    If the node is found, delete the node.

Note: Time complexity should be O(height of tree).

Example:

root = [5,3,6,2,4,null,7]
key = 3

    5
   / \
  3   6
 / \   \
2   4   7

Given key to delete is 3. So we find the node with value 3 and delete it.

One valid answer is [5,4,6,2,null,null,7], shown in the following BST.

    5
   / \
  4   6
 /     \
2       7

Another valid answer is [5,2,6,null,4,null,7].

    5
   / \
  2   6
   \   \
    4   7
    
=end

	
def findMin(node)
	node=node.left until node.left.nil?
	return node
end

# @param {TreeNode} root
# @param {Integer} key
# @return {TreeNode}
def delete_node(root, key)  
	#Find
	if root.nil?
		return nil
	elsif root.val > key
		root.left = delete_node(root.left,key)
	elsif root.val < key
		root.right = delete_node(root.right, key)
	else
		#Found
		if(root.right.nil? && root.left.nil?) #Leaf
			root=nil 
		elsif(root.right.nil? && !root.left.nil?) #Has left child
			root=root.left
		elsif(root.left.nil? && !root.right.nil?) #Has right child
			root=root.right
		else #Two children. Find inorder successor, copy contents in current node and delete successor
			root.val=findMin(root.right).val
			root.right=delete_node(root.right, root.val)
		end			
	end
	return root		
end

	
