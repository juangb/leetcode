=begin
Generate Parentheses

Given n pairs of parentheses, write a function to generate all combinations of well-formed parentheses.

For example, given n = 3, a solution set is:

[
  "((()))",
  "(()())",
  "(())()",
  "()(())",
  "()()()"
]
=end
# @param {Integer} n
# @return {String[]}
def generate_parenthesis(n)
	sol = []
	generate = -> (prefix, count) {
		if prefix.length == n*2
			sol << prefix
		else
			generate.(prefix + "(", count + 1) if count < n && n*2 - prefix.length > count
			generate.(prefix + ")", count - 1) if count > 0
		end
	}
	generate.("", 0)
	sol
end

puts generate_parenthesis(0)
