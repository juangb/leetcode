=begin
 Number of Islands

Given a 2d grid map of '1's (land) and '0's (water), count the number of islands. An island is surrounded by water and is formed by connecting adjacent lands horizontally or vertically. You may assume all four edges of the grid are all surrounded by water.

Example 1:

Input:
11110
11010
11000
00000

Output: 1

Example 2:

Input:
11000
11000
00100
00011

Output: 3
=end


def del_island(grid, i, j)	
	return  if i<0 || i>=grid.length || j<0 || j>=grid[0].length || grid[i][j] == '0'		 
	
	grid[i][j] = '0'	
	del_island(grid, i, j - 1) 
	del_island(grid, i, j + 1) 
	del_island(grid, i - 1, j) 
	del_island(grid, i + 1, j)
end

# @param {Character[][]} grid
# @return {Integer}
def num_islands(grid)
	#Calculate if grid[i][j] is part of an island, and set the whole island to 'water'
	i, j, count = 0, 0, 0
	for i in 0..grid.length-1
		for j in 0..grid[0].length-1
			if grid[i][j] == '1'
				count += 1
				del_island(grid,i,j)
			end
		end
	end
	count
end

array = [["1","1","1","1","0"],["1","1","0","1","0"],["1","1","0","0","0"],["0","0","0","0","1"]]
puts num_islands(array)
puts array.to_s




