# @param {Integer[]} nums
# @return {Integer}
# O(nlogn) solution sorting
def single_number2(nums)
	nums.sort!
	i=0
	while(i<nums.length)
		return nums[i] if nums[i]!=nums[i+1]
		i +=2
	end
	return nums[length-1]
end

# @param {Integer[]} nums
# @return {Integer}
def single_number(nums)
	return nums.reduce(:^)
end

puts single_number([4,5,4])