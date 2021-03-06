=begin
 Rotate Image

You are given an n x n 2D matrix representing an image.

Rotate the image by 90 degrees (clockwise).

Note:

You have to rotate the image in-place, which means you have to modify the input 2D matrix directly. DO NOT allocate another 2D matrix and do the rotation.

Example 1:

Given input matrix = 
[
  [1,2,3],
  [4,5,6],
  [7,8,9]
],

rotate the input matrix in-place such that it becomes:
[
  [7,4,1],
  [8,5,2],
  [9,6,3]
]

Example 2:

Given input matrix =
[
  [ 5, 1, 9,11],
  [ 2, 4, 8,10],
  [13, 3, 6, 7],
  [15,14,12,16]
], 

rotate the input matrix in-place such that it becomes:
[
  [15,13, 2, 5],
  [14, 3, 4, 1],
  [12, 6, 8, 9],
  [16, 7,10,11]
]

=end
# @param {Integer[][]} matrix
# @return {Void} Do not return anything, modify matrix in-place instead.
def rotate(matrix)
	#Transpose matrix in place
	for i in 0..matrix.length-1
		for j in i+1..matrix[0].length-1
			matrix[i][j], matrix[j][i] = matrix[j][i], matrix[i][j] #swap
		end
	end
	#Swap cols
	for i in 0..matrix.length-1
		for j in 0..(matrix[0].length-1)/2
			matrix[i][j], matrix[i][matrix.length-1-j] = matrix[i][matrix.length-1-j], matrix[i][j] #swap
		end
	end
end

input_matrix = 
[
  [1,2,3],
  [4,5,6],
  [7,8,9]
]
rotate(input_matrix)
puts input_matrix.to_s



