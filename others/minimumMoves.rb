=begin
462. Minimum Moves to Equal Array Elements II
Medium

Given a non-empty integer array, find the minimum number of moves required to make all array elements equal, where a move is incrementing a selected element by 1 or decrementing a selected element by 1.

You may assume the array's length is at most 10,000.

Example:

Input:
[1,2,3]

Output:
2

Explanation:
Only two moves are needed (remember each move increments or decrements one element):

[1,2,3]  =>  [2,2,3]  =>  [2,2,2]
=end

# @param {Integer[]} nums
# @return {Integer}
def min_moves2(nums)
	median=nums.sort[nums.length/2]		
	moves=0
	nums.each{ |num|
		moves += (median-num).abs()
	}
	return moves	
end