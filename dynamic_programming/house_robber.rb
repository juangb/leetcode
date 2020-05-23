=begin
House Robber

You are a professional robber planning to rob houses along a street. Each house has a certain amount of money stashed, the only constraint stopping you from robbing each of them is that adjacent houses have security system connected and it will automatically contact the police if two adjacent houses were broken into on the same night.

Given a list of non-negative integers representing the amount of money of each house, determine the maximum amount of money you can rob tonight without alerting the police.

Example 1:

Input: [1,2,3,1]
Output: 4
Explanation: Rob house 1 (money = 1) and then rob house 3 (money = 3).
             Total amount you can rob = 1 + 3 = 4.

Example 2:

Input: [2,7,9,3,1]
Output: 12
Explanation: Rob house 1 (money = 2), rob house 3 (money = 9) and rob house 5 (money = 1).
             Total amount you can rob = 2 + 9 + 1 = 12.

=end

# @param {Integer[]} nums
# @return {Integer}
def rob_array(nums)
	return 0 if nums.empty?		
	return nums[0] if nums.length == 1		
	return nums.max if nums.length == 2
			
	max_money=[nums[0],nums[1]] #Not really necessary to use an array. We could just keep track of 2 variables
	
	for i in 2..nums.length-1
		max_money[i] = [max_money[i-2] + nums[i], max_money[i-1]].max
		max_money[i-1] = [max_money[i-1], max_money[i-2]].max
	end
	#puts max_money.to_s
	return max_money.last
end


def rob(nums)
	return 0 if nums.empty?		
	return nums[0] if nums.length == 1		
	return nums.max if nums.length == 2			
	prev = nums[0]
	curr = nums[1]		
	for i in 2..nums.length-1		
		curr, prev = [prev + nums[i], curr].max, [curr, prev].max	
	end
	return curr
end

puts rob([1,2,3,1])
puts rob([2,7,9,3,1])
puts rob_array([2,1,1,2])


