=begin
Permutations

Given a collection of distinct integers, return all possible permutations.

Example:

Input: [1,2,3]
Output:
[
  [1,2,3],
  [1,3,2],
  [2,1,3],
  [2,3,1],
  [3,1,2],
  [3,2,1]
]

=end

# @param {Integer[]} nums
# @return {Integer[][]}
def permute(nums)
	return [] if nums.nil? || nums.empty?
	sol = []	
	permute_lambda = -> (prefix, rest) {
		if rest.empty?
			sol << prefix
		else
			rest.each_with_index{ |digit, i|
				permute_lambda.(prefix.dup << digit, i==0 ? rest[i+1..-1] : rest[0..i-1] + rest[i+1..-1] )
			}
		end
	}
	permute_lambda.([], nums)
	sol
end

puts permute([1,-1,3]).to_s





