=begin
 Given a string, find the first non-repeating character in it and return it's index. 
 If it doesn't exist, return -1.

Examples:

s = "leetcode"
return 0.

s = "loveleetcode",
return 2.

Note: You may assume the string contain only lowercase letters. 
=end

# @param {String} s
# @return {Integer}
def first_uniq_char2(s)
	lettersHash={}
	for i in 0..s.length-1		
		lettersHash[s[i]] = lettersHash[s[i]].to_i() +1		
	end
	for i in 0..s.length-1
		return i if lettersHash[s[i]]==1
	end
	return -1
end




puts first_uniq_char("")

