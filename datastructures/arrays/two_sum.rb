=begin
Two Sum

Given an array of integers, return indices of the two numbers such that they add up to a specific target.

You may assume that each input would have exactly one solution, and you may not use the same element twice.

Example:

Given nums = [2, 7, 11, 15], target = 9,

Because nums[0] + nums[1] = 2 + 7 = 9,
return [0, 1].
=end

# @param {Integer[]} nums
# @param {Integer} target
# @return {Integer[]}
def two_sum(nums, target)
	hash={}
	nums.each_index{ |i|
		return [hash[target-nums[i]], i] unless hash[target-nums[i]].nil?
		hash[nums[i]]=i
	}
end

puts two_sum([2, 7, 11, 15], 9).to_s