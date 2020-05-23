=begin
Search a 2D Matrix II

Write an efficient algorithm that searches for a value in an m x n matrix. This matrix has the following properties:

    Integers in each row are sorted in ascending from left to right.
    Integers in each column are sorted in ascending from top to bottom.

Example:

Consider the following matrix:

[
  [1,   4,  7, 11, 15],
  [2,   5,  8, 12, 19],
  [3,   6,  9, 16, 22],
  [10, 13, 14, 17, 24],
  [18, 21, 23, 26, 30]
]

Given target = 5, return true.

Given target = 20, return false.
=end

#TODO Not finished yet

#Binary search (max 4 times) O(4logn) complexity
# @param {Integer[][]} matrix
# @param {Integer} target
# @return {Boolean}
def search_matrix(matrix, target)

end


def bs(row,target)
	l=0
	r=row.length-1
	while l<=r
		puts "l: #{l}, r: #{r}"
		mid = (l+r)/2
		return [l, row[l]] if target == row[l]
		return [l,row[l]] if l == r
		if target <= row[mid]
			r = mid
		else
			l = mid+1
		end
	end

	
end


puts bs([1, 4,  7, 11, 15],16).to_s


