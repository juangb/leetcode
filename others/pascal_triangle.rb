=begin
Pascal's Triangle

Given a non-negative integer numRows, generate the first numRows of Pascal's triangle.


In Pascal's triangle, each number is the sum of the two numbers directly above it.

Example:

Input: 5
Output:
[
     [1],
    [1,1],
   [1,2,1],
  [1,3,3,1],
 [1,4,6,4,1]
]
=end

# @param {Integer} num_rows
# @return {Integer[][]}
def generate(num_rows)	
	triangle = []
	for i in 0..num_rows-1
		for j in 0..i
			if j == 0 
				triangle[i] = [1]
			elsif j == i
				triangle[i][j] = 1
			else
				triangle[i][j] = triangle[i-1][j-1] + triangle[i-1][j]
			end
		end
	end
	return triangle
end

puts generate(0).to_s

puts generate(5).to_s

