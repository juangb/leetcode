require 'set'
# @param {Integer[]} nums
# @return {Boolean}
def contains_duplicate(nums)
	return nums.to_set.length!=nums.length
end

puts contains_duplicate([1,2,3]).to_s