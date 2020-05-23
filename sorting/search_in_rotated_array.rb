=begin
Search in Rotated Sorted Array

Suppose an array sorted in ascending order is rotated at some pivot unknown to you beforehand.

(i.e., [0,1,2,4,5,6,7] might become [4,5,6,7,0,1,2]).

You are given a target value to search. If found in the array return its index, otherwise return -1.

You may assume no duplicate exists in the array.

Your algorithm's runtime complexity must be in the order of O(log n).

Example 1:

Input: nums = [4,5,6,7,0,1,2], target = 0
Output: 4

Example 2:

Input: nums = [4,5,6,7,0,1,2], target = 3
Output: -1

=end

# @param {Integer[]} nums
# @param {Integer} target
# @return {Integer}
def search(nums, target)
	l = 0
	r = nums.length-1
	
	while l<=r
		#puts "l: #{l}, r: #{r}"
		mid = (l+r)/2		
		return l if target == nums[l]		
		if (nums[l] < nums [mid] && target <= nums[mid] && target > nums[l]) || ( nums[l] > nums[mid] && (target > nums[l] || target <= nums[mid]))
			r = mid
		else
			l = mid+1
		end
	end
	-1
end


puts search([4,5,6,7,0,1,2], 3).to_s
puts search([1,3], 3).to_s
puts search([4,5,6,7,0,1,2],1).to_s
puts search([7,8,1,2,3,4,5,6],2).to_s

