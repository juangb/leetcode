=begin
Maximum Subarray

Given an integer array nums, find the contiguous subarray (containing at least one number) which has the largest sum and return its sum.

Example:

Input: [-2,1,-3,4,-1,2,1,-5,4],
Output: 6
Explanation: [4,-1,2,1] has the largest sum = 6.

Follow up:

If you have figured out the O(n) solution, try coding another solution using the divide and conquer approach, which is more subtle.
=end

# @param {Integer[]} nums
# @return {Integer}
def max_sub_array(nums)
	current_sum = - Float::INFINITY
	max_sum = - Float::INFINITY
	nums.each{ |num|
		current_sum = [current_sum + num , num].max #Better adding the element or the element on it's own
		max_sum = [current_sum, max_sum].max
	}
	return max_sum
end

puts max_sub_array([-2,1,-3,4,-1,2,1,-5,4])
puts max_sub_array([-200,1,-3,4,-1,2,1,-5,4])