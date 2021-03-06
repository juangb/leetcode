=begin
Missing Number

Given an array containing n distinct numbers taken from 0, 1, 2, ..., n, find the one that is missing from the array.

Example 1:

Input: [3,0,1]
Output: 2

Example 2:

Input: [9,6,4,2,3,5,7,0,1]
Output: 8

Note:
Your algorithm should run in linear runtime complexity. Could you implement it using only constant extra space complexity?
=end
# @param {Integer[]} nums
# @return {Integer}
def missing_number(nums)
	sum = nums.reduce(:+)
	sum_total=0
	for i in 0..nums.length
		sum_total += i
	end
	return sum_total - sum
end

#######
# One line solution. Maybe not constant extra space
####
def missing_number(nums)
   (0..nums.size).sum - nums.sum 
end
