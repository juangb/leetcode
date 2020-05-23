=begin
 Longest Palindromic Substring

Given a string s, find the longest palindromic substring in s. You may assume that the maximum length of s is 1000.

Example 1:

Input: "babad"
Output: "bab"
Note: "aba" is also a valid answer.

Example 2:

Input: "cbbd"
Output: "bb"

=end

#########################
# Runs in O(n²)
#########################
# @param {String} s
# @return {String}
def longest_palindrome(s)
	return "" if s.nil? || s.length == 0
	max_size = 1
	pal = s[0]
	
	get_max = -> (even) {
		for i in 0..s.length-1
			left = right = i
			left += 1 if even
			while left > 0 && right < s.length-1 && s[left-1] == s[right+1]	
				left -= 1
				right += 1			
			end
			size = right - left + 1
			if size > max_size
				max_size = size
				pal = s[left..right]
			end
		end
	}
	get_max.(false)
	get_max.(true)
	return pal
end

########################################
# TODO Manachers algorithm. Runs in O(n)
######################################


puts longest_palindrome("bbb")

