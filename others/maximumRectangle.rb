=begin
85. Maximal Rectangle
Hard

Given a 2D binary matrix filled with 0's and 1's, find the largest rectangle containing only 1's and return its area.

Example:

Input:
[
  ["1","0","1","0","0"],
  ["1","0","1","1","1"],
  ["1","1","1","1","1"],
  ["1","0","0","1","0"]
]
Output: 6

=end

# Checks if all there is any 0s 
# @param {Character[][]} matrix
# @return {Boolean}
def has_all_ones(matrix,i1,j1,i2,j2)
	for i in i1..i2
		for j in j1..j2
			#puts "i1: #{i1}, j1: #{j1}, i2: #{i2}, j2: #{j2}"
			return false if matrix[i][j] =="0"
		end
	end	
	return true
end

# @param {Character[][]} matrix
# @param {Integer} i1
# @param {Integer} j1
# @return {Integer}
def maximal_rectangle_helper(matrix,i1,j1)
	max_area=0
	for i in i1..matrix.length-1
		for j in j1..matrix[0].length-1
			if has_all_ones(matrix,i1,j1,i,j)
				area=(i-i1+1)*(j-j1+1)
				#puts area
				max_area = area if area > max_area
			else
				break;
			end
		end
	end
	
	return max_area
end

# @param {Character[][]} matrix
# @return {Integer}
def maximal_rectangle(matrix)
	max_area=0
	for i in 0..matrix.length-1
		for j in 0..matrix[0].length-1
			area=maximal_rectangle_helper(matrix,i,j)
			max_area=area if area > max_area
		end
	end
	return max_area
end

puts maximal_rectangle([
  ["1","0","1","0","0"],
  ["1","0","1","1","1"],
  ["1","1","1","1","1"],
  ["1","0","0","1","0"]
])
