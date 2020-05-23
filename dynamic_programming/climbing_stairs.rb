=begin
Climbing Stairs

You are climbing a stair case. It takes n steps to reach to the top.

Each time you can either climb 1 or 2 steps. In how many distinct ways can you climb to the top?

Note: Given n will be a positive integer.

Example 1:

Input: 2
Output: 2
Explanation: There are two ways to climb to the top.
1. 1 step + 1 step
2. 2 steps

Example 2:

Input: 3
Output: 3
Explanation: There are three ways to climb to the top.
1. 1 step + 1 step + 1 step
2. 1 step + 2 steps
3. 2 steps + 1 step

=end

###################
# It's the same as n!
# Recursive
#####################
# @param {Integer} n
# @return {Integer}
def climb_stairs_recursive(n)
	#ways = [0, 1, 2, 3]
	return 0 if n == 0
	return 1 if n == 1
	return 2 if n == 2
	return climb_stairs(n-1) + climb_stairs(n-2)	
end

########################
# More eficient
#######################3

# @param {Integer} n
# @return {Integer}
def climb_stairs(n)
	ways = [0, 1, 2]
	for i in 3..n
		ways[i] = ways[i-1] + ways[i-2]
	end
	return ways[n]	
end

puts climb_stairs(5)


