=begin
Letter Combinations of a Phone Number

Given a string containing digits from 2-9 inclusive, return all possible letter combinations that the number could represent.

A mapping of digit to letters (just like on the telephone buttons) is given below. Note that 1 does not map to any letters.

Example:

Input: "23"
Output: ["ad", "ae", "af", "bd", "be", "bf", "cd", "ce", "cf"].

Note:

Although the above answer is in lexicographical order, your answer could be in any order you want.
=end

# @param {String} digits
# @return {String[]}
def letter_combinations(digits)
	return [] if digits.nil? || digits.length == 0
	hash = { "2" => "abc",
			"3" => "def",
			"4" => "ghi",
			"5" => "jkl",
			"6" => "mno",
			"7" => "pqrs",
			"8" => "tuv",
			"9" => "wxyz"}
	hash.transform_values!(&:chars)
	sol = []
	combination = -> (prefix, digits){
		if digits.length == 0
			sol << prefix
		else
			hash[digits[0]].each{ |letter|
				combination.(prefix+letter, digits[1..-1])
			}
		end
	}
	combination.("",digits)
	sol
end


puts letter_combinations("234").to_s
