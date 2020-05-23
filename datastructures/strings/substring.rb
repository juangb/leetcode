=begin
 Implement strStr()

Implement strStr().

Return the index of the first occurrence of needle in haystack, or -1 if needle is not part of haystack.

Example 1:

Input: haystack = "hello", needle = "ll"
Output: 2

Example 2:

Input: haystack = "aaaaa", needle = "bba"
Output: -1

Clarification:

What should we return when needle is an empty string? This is a great question to ask during an interview.

For the purpose of this problem, we will return 0 when needle is an empty string. This is consistent to C's strstr() and Java's indexOf().

=end

# @param {String} haystack
# @param {String} needle
# @return {Integer}
def str_str_split(haystack, needle)
	return 0 if needle.length == 0 || haystack == needle
	return -1 if haystack.length < needle.length		
	splitted = haystack.split(needle)[0]
	return 0 if splitted.nil?
	return -1 if splitted.length == haystack.length
	return splitted.length	
end


def str_str(haystack, needle)
	index = haystack.index(needle)
	index.nil? ? -1 : index		
end

var="sh"
puts str_str("holasholahola",var)


