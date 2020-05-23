=begin
Set Matrix Zeroes

Given a m x n matrix, if an element is 0, set its entire row and column to 0. Do it in-place.

Example 1:

Input: 
[
  [1,1,1],
  [1,0,1],
  [1,1,1]
]
Output: 
[
  [1,0,1],
  [0,0,0],
  [1,0,1]
]

Example 2:

Input: 
[
  [0,1,2,0],
  [3,4,5,2],
  [1,3,1,5]
]
Output: 
[
  [0,0,0,0],
  [0,4,5,0],
  [0,3,1,0]
]

=end

# @param {Integer[][]} matrix
# @return {Void} Do not return anything, modify matrix in-place instead.
def set_zeroes(matrix)
	first_row = false
	first_col = false
	#First pass. Mark columns and row to be 'zeroed'
	for i in 0..matrix.length-1
		for j in 0..matrix[0].length-1
			if matrix[i][j] == 0
				if i == 0 || j == 0
					first_row = true if i == 0				
					first_col = true if j == 0
				else
					matrix[i][0] = 0
					matrix[0][j] = 0
				end
			end
		end
	end
	#Second pass. Set all marked rows and columns to zero
	(matrix.length-1).downto(0){ |i|		
		(matrix[0].length-1).downto(0){ |j|
			matrix[i][j] = 0 if matrix[i][0] == 0 || matrix[0][j] == 0 || (first_row && i == 0 ) || (first_col && j == 0)
			
		}
	}
end
