=begin
Longest Substring Without Repeating Characters

Given a string, find the length of the longest substring without repeating characters.

Example 1:

Input: "abcabcbb"
Output: 3 
Explanation: The answer is "abc", with the length of 3. 

Example 2:

Input: "bbbbb"
Output: 1
Explanation: The answer is "b", with the length of 1.

Example 3:

Input: "pwwkew"
Output: 3
Explanation: The answer is "wke", with the length of 3. 
             Note that the answer must be a substring, "pwke" is a subsequence and not a substring.

=end
require 'set'

######################
# O(n²)
####################
# @param {String} s
# @return {Integer}
def length_of_longest_substring2(s)
	ans = 0
	for i in 0..s.length-1
		char_set = Set.new
		temp_ans=0
		for j in i..s.length-1
			if char_set.include?(s[j])
				ans = [temp_ans, ans].max
				break
			end
			char_set << s[j]
			temp_ans += 1
			ans = [temp_ans, ans].max if j == s.length - 1
		end
	end
	ans
end


######################
# O(n)
####################
# @param {String} s
# @return {Integer}
def length_of_longest_substring3(s)
	i, j, ans = 0, 0, 0
	char_set = Set.new
	while i < s.length && j < s.length
		if !char_set.include?(s[j])
			ans = [ans, j - i + 1].max
			char_set << s[j]
			j += 1
		else
			char_set.delete(s[i])
			i += 1			
		end		
	end
	ans
end

######################
# O(n) faster
####################
# @param {String} s
# @return {Integer}
def length_of_longest_substring(s)
	i, j, ans = 0, 0, 0
	hash = Hash.new
	while i < s.length && j < s.length
		if !hash.include?(s[j])
			ans = [ans, j - i + 1].max
			hash[s[j]] = j
			j += 1
		else
			i = hash.delete(s[i]) + 1
		end		
	end
	ans
end


puts length_of_longest_substring2("abcasha6")
