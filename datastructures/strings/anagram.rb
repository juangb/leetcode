=begin
Given two strings s and t , write a function to determine if t is an anagram of s.

Example 1:

Input: s = "anagram", t = "nagaram"
Output: true

Example 2:

Input: s = "rat", t = "car"
Output: false

Note:
You may assume the string contains only lowercase alphabets.

Follow up:
What if the inputs contain unicode characters? How would you adapt your solution to such case?
=end

# @param {String} s
# @param {String} t
# @return {Boolean}
def is_anagram(s, t)
	return s.chars.sort == t.chars.sort
end