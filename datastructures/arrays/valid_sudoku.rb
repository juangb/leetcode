=begin
Valid Sudoku

Determine if a 9x9 Sudoku board is valid. Only the filled cells need to be validated according to the following rules:

    Each row must contain the digits 1-9 without repetition.
    Each column must contain the digits 1-9 without repetition.
    Each of the 9 3x3 sub-boxes of the grid must contain the digits 1-9 without repetition.


A partially filled sudoku which is valid.

The Sudoku board could be partially filled, where empty cells are filled with the character '.'.

Example 1:

Input:
[
  ["5","3",".",".","7",".",".",".","."],
  ["6",".",".","1","9","5",".",".","."],
  [".","9","8",".",".",".",".","6","."],
  ["8",".",".",".","6",".",".",".","3"],
  ["4",".",".","8",".","3",".",".","1"],
  ["7",".",".",".","2",".",".",".","6"],
  [".","6",".",".",".",".","2","8","."],
  [".",".",".","4","1","9",".",".","5"],
  [".",".",".",".","8",".",".","7","9"]
]
Output: true

Example 2:

Input:
[
  ["8","3",".",".","7",".",".",".","."],
  ["6",".",".","1","9","5",".",".","."],
  [".","9","8",".",".",".",".","6","."],
  ["8",".",".",".","6",".",".",".","3"],
  ["4",".",".","8",".","3",".",".","1"],
  ["7",".",".",".","2",".",".",".","6"],
  [".","6",".",".",".",".","2","8","."],
  [".",".",".","4","1","9",".",".","5"],
  [".",".",".",".","8",".",".","7","9"]
]
Output: false
Explanation: Same as Example 1, except with the 5 in the top left corner being 
    modified to 8. Since there are two 8's in the top left 3x3 sub-box, it is invalid.

Note:

    A Sudoku board (partially filled) could be valid but is not necessarily solvable.
    Only the filled cells need to be validated according to the mentioned rules.
    The given board contain only digits 1-9 and the character '.'.
    The given board size is always 9x9.

=end
require "matrix"

def is_valid(row)
	hash={}
	row.each_index{ |i|
		hash[row[i]] = hash[row[i]].to_i + 1 unless row[i] == "."
	}
	hash.each_value{ |value|
		return false if value > 1
	}
	return true
end

# @param {Character[][]} board
# @return {Boolean}
def is_valid_sudoku2(board)
	#Check rows
	board.each{ |row|		
		return false unless is_valid(row)		
	}
	#Check cols
	board_trans=board.transpose()
	board_trans.each{ |col|		
		return false unless is_valid(col)
	}
	#Check submatrix
	for i in 0..2
		for j in 0..2
			return false unless is_valid(board[3*j][3*i..3*i+2].concat(board[3*j+1][3*i..3*i+2]).concat(board[3*j+2][3*i..3*i+2]))
		end
	end
	return true
end

####################################
#   SHORTER SOLUTION
####################################
require 'set'
def is_valid_sudoku(board)
	sdk_set= Set.new
	for i in 0..8
		for j in 0..8
			next if board[i][j] == "." 
			return false if sdk_set.add?("r#{i.to_s}#{board[i][j]}").nil? || sdk_set.add?("c#{j.to_s}#{board[i][j]}").nil? || sdk_set.add?("b#{(i/3).to_s}#{(j/3).to_s}#{board[i][j]}").nil?			
		end
	end
	return true
end

sudoku=[
  ["5","3",".",".","7",".",".",".","."],
  ["6",".",".","1","9","5",".",".","."],
  [".","9","8",".",".",".",".","6","."],
  ["8",".",".",".","6",".",".",".","3"],
  ["4",".",".","8",".","3",".",".","1"],
  ["7",".",".",".","2",".",".",".","6"],
  [".","6",".",".",".",".","2","8","."],
  [".",".",".","4","1","9",".",".","5"],
  [".",".",".",".","8",".",".","7","9"]
]
puts is_valid_sudoku(sudoku)

