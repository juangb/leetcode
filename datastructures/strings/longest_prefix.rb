=begin
Longest Common Prefix

Write a function to find the longest common prefix string amongst an array of strings.

If there is no common prefix, return an empty string "".

Example 1:

Input: ["flower","flow","flight"]
Output: "fl"

Example 2:

Input: ["dog","racecar","car"]
Output: ""
Explanation: There is no common prefix among the input strings.

Note:

All given inputs are in lowercase letters a-z.
=end
#puts "Min length: #{min_length}"
#puts "Index: #{index}"

# @param {String[]} strs
# @return {String}
def longest_common_prefix(strs)	
	min_length = strs.map(&:length).min
	return "" if strs.nil? || strs.length==0 || min_length ==0	
	for index in 0..min_length-1		
		for j in 1..strs.length-1			
			if strs[j][index]!= strs[j-1][index]
				return "" if index == 0
				return strs[0][0..index-1] 
			end
		end
	end
	return strs[0][0..min_length-1]
end

#Simpler solution
def longest_common_prefix(strs)
  return "" if strs.empty?
  result = ""
  for i in (0..strs[0].size - 1)
    c = strs[0][i]
    for j in (1..strs.size - 1)
      return result if strs[j][i] != c
    end
    result.concat(c)
  end
  result
end

puts longest_common_prefix(["aa","a","a"])
puts longest_common_prefix(["dog","racecar","car"])
puts longest_common_prefix([])
