=begin
258. Add Digits
Easy

Given a non-negative integer num, repeatedly add all its digits until the result has only one digit.

Example:

Input: 38
Output: 2 
Explanation: The process is like: 3 + 8 = 11, 1 + 1 = 2. 
             Since 2 has only one digit, return it.

Follow up:
Could you do it without any loop/recursion in O(1) runtime?
=end
# @param {Integer} num
# @return {Integer}
def add_digits(num)
	digits=num.to_s.split("").map(&:to_i)	
	sum=digits[0]
	for i in 1..digits.length-1
		sum += digits[i]
		sum = sum%10 + sum/10 if sum>9		
	end
	return sum
end

#SOLUTION 2
# @param {Integer} num
# @return {Integer}
def add_digits(num)		
	sum=num%10
	while(num/10 > 0)
		num = num/10
		sum += num %10
		sum = sum%10 + sum/10 if sum>9		
	end
	return sum
end


puts add_digits(38).to_s

