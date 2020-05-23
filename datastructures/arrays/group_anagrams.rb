=begin
Group Anagrams

Given an array of strings, group anagrams together.

Example:

Input: ["eat", "tea", "tan", "ate", "nat", "bat"],
Output:
[
  ["ate","eat","tea"],
  ["nat","tan"],
  ["bat"]
]

Note:

    All inputs will be in lowercase.
    The order of your output does not matter.

=end
# @param {String[]} strs
# @return {String[][]}
def group_anagrams(strs)
	hash = {}
	strs.each{ |str|
		sorted = str.chars.sort.join
		hash[sorted] = [] if hash[sorted].nil?
		hash[sorted] << str		
	}
	hash.values
end

puts group_anagrams(["eat", "tea", "tan", "ate", "nat", "bat"]).to_s


