=begin
Reverse String

Write a function that reverses a string. The input string is given as an array of characters char[].

Do not allocate extra space for another array, you must do this by modifying the input array in-place with O(1) extra memory.

You may assume all the characters consist of printable ascii characters.

 

Example 1:

Input: ["h","e","l","l","o"]
Output: ["o","l","l","e","h"]

Example 2:

Input: ["H","a","n","n","a","h"]
Output: ["h","a","n","n","a","H"]

=end
# @param {Character[]} s
# @return {Void} Do not return anything, modify s in-place instead.
def reverse_string(s)
	return if s.nil? || s.length<2
	for i in 0..(s.length-1)/2
		s[i], s[s.length-1-i] = s[s.length-1-i], s[i]
	end
end

input = ["h","e","l","l","o"]
reverse_string(input)
puts input.to_s


