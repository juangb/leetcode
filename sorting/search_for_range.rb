=begin
Search for a Range

Given an array of integers nums sorted in ascending order, find the starting and ending position 
of a given target value.

Your algorithm's runtime complexity must be in the order of O(log n).

If the target is not found in the array, return [-1, -1].

Example 1:

Input: nums = [5,7,7,8,8,10], target = 8
Output: [3,4]

Example 2:

Input: nums = [5,7,7,8,8,10], target = 6
Output: [-1,-1]

=end


def binary_search(nums,target,right)
	l = 0
	r = nums.length
	while l < r
		mid = (l+r)/2
		if nums[mid] < target || (nums[mid] == target && right)
			l = mid + 1		
		else
			r = mid
		end
	end
	l
end

# @param {Integer[]} nums
# @param {Integer} target
# @return {Integer[]}
def search_range(nums, target)
	l = binary_search(nums, target, false)
	return [-1,-1] if l < 0 || l >= nums.length || nums[l]!=target
	[l, binary_search(nums, target, true) -1]
end




puts binary_search([1,1,2], 4, false).to_s
puts search_range([1,2,3,3,3,3,4,5,9], 3).to_s
puts search_range([0,0,0,0,0,0,1,1,2,2,3,3,4,4,4], 0).to_s

puts binary_search([0,0,0,1,1,2,2,3,3,4,4,4,5], 5, true)
