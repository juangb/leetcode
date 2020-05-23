=begin
Subsets

Given a set of distinct integers, nums, return all possible subsets (the power set).

Note: The solution set must not contain duplicate subsets.

Example:

Input: nums = [1,2,3]
Output:
[
  [3],
  [1],
  [2],
  [1,2,3],
  [1,3],
  [2,3],
  [1,2],
  []
]

=end

#########################
# Recursive solution
###########################
# @param {Integer[]} nums
# @return {Integer[][]}
def subsets(nums)
	sol = []
	
	subset_lambda = -> (prefix, rest){		
		sol << prefix
		return if rest.empty?
		rest.each_with_index{ |num, i|
			subset_lambda.(prefix.dup << num, rest[i+1..-1])
		}
	}
	subset_lambda.([],nums)
	sol
end

puts subsets([1,2,3]).to_s





