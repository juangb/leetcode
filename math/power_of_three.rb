=begin
Power of Three

Given an integer, write a function to determine if it is a power of three.

Example 1:

Input: 27
Output: true

Example 2:

Input: 0
Output: false

Example 3:

Input: 9
Output: true

Example 4:

Input: 45
Output: false

Follow up:
Could you do it without using any loop / recursion?
=end

# @param {Integer} n
# @return {Boolean}
def is_power_of_three2(n)	
	n /= 3.0 while n >= 3
	return n == 1
end

#######################
# Better solution. No loop. Using log3
#####################
# @param {Integer} n
# @return {Boolean}
def is_power_of_three3(n)	
	return false if n <= 0
	log = Math::log(n, 3)
	epsilon = 10**(-12)
	puts log
	return  (log + epsilon) % 1 <= 2* epsilon
end

#######################
# Better solution using log. Without the epsilon workaround
###########################
def is_power_of_three(n)	
	return false if n <= 0
	return 3**(Math::log(n, 3)).round == n
end


puts is_power_of_three(129140163)
