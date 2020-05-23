=begin
Find Peak Element

A peak element is an element that is greater than its neighbors.

Given an input array nums, where nums[i] ≠ nums[i+1], find a peak element and return its index.

The array may contain multiple peaks, in that case return the index to any one of the peaks is fine.

You may imagine that nums[-1] = nums[n] = -∞.

Example 1:

Input: nums = [1,2,3,1]
Output: 2
Explanation: 3 is a peak element and your function should return the index number 2.

Example 2:

Input: nums = [1,2,1,3,5,6,4]
Output: 1 or 5 
Explanation: Your function can return either index number 1 where the peak element is 2, 
             or index number 5 where the peak element is 6.

Note:

Your solution should be in logarithmic complexity.
=end

###################
# O(n) complexity
##################
# @param {Integer[]} nums
# @return {Integer}
def find_peak_element_linear(nums)
	return nil if nums.nil? || nums.empty?
	
	return 0 if nums.length == 1 || (nums.length > 1 && nums[1]<nums[0]	)
	for i in 1..nums.length-2
		return i if nums[i-1] < nums[i] && nums[i] > nums[i+1]		
	end
	return nums.length-1 if nums[nums.length-2] < nums[nums.length-1]
end

######################
# O (logn)
######################
def find_peak_element(nums)
	return nil if nums.nil? || nums.empty?
	left = 0
	right = nums.length-1
	
	while left < right
		#p "l: #{left}, r: #{right}"
		mid = (right+left) / 2
		if nums[mid] > nums[mid+1]
			right = mid
		else
			left = mid +1
		end
	end
	left
end

p find_peak_element([1,2,3,1])



