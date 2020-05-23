=begin
 Increasing Triplet Subsequence

Given an unsorted array return whether an increasing subsequence of length 3 exists or not in the array.

Formally the function should:

    Return true if there exists i, j, k
    such that arr[i] < arr[j] < arr[k] given 0 ≤ i < j < k ≤ n-1 else return false.

Note: Your algorithm should run in O(n) time complexity and O(1) space complexity.

Example 1:

Input: [1,2,3,4,5]
Output: true

Example 2:

Input: [5,4,3,2,1]
Output: false

=end

# @param {Integer[]} nums
# @return {Boolean}
def increasing_triplet(nums)
	first = second = Float::INFINITY
	
	nums.each{ |num|
		if num > second
			return true
		elsif num <= first
			first = num
		elsif num < second
			second = num
		end
	}	
	return false
end

puts increasing_triplet([1,1,-2,6])

