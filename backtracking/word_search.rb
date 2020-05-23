=begin
Word Search

Given a 2D board and a word, find if the word exists in the grid.

The word can be constructed from letters of sequentially adjacent cell, where "adjacent" cells are those horizontally or vertically neighboring. The same letter cell may not be used more than once.

Example:

board =
[
  ['A','B','C','E'],
  ['S','F','C','S'],
  ['A','D','E','E']
]

Given word = "ABCCED", return true.
Given word = "SEE", return true.
Given word = "ABCB", return false.

 

Constraints:

    board and word consists only of lowercase and uppercase English letters.
    1 <= board.length <= 200
    1 <= board[i].length <= 200
    1 <= word.length <= 10^3

=end

#################################
# Funciona pero Time Limit exceeded
##############################
require 'set'
# @param {Character[][]} board
# @param {String} word
# @return {Boolean}
def exist(board, word)	
	exist_lambda = -> (i, j, pos, used){ #i, j -> Indexes in the board. pos-> position in the word
		if pos >= word.length
			return true 
		elsif i<0 || i >= board.length || j<0 || j>=board[0].length || used.include?([i,j]) || board[i][j] != word[pos]	
			return false
		else # board[i][j] == word[pos]			
			used << [i,j]
			found = exist_lambda.(i+1,j,pos+1, used) || exist_lambda.(i-1,j,pos+1,used) || exist_lambda.(i,j+1,pos+1,used) || exist_lambda.(i,j-1,pos+1,used)
			used.delete([i,j])
			return found
		end	
	}

	for i in 0..board.length-1
		for j in 0..board[0].length-1
			return true if exist_lambda.(i,j,0, Set.new)
		end
	end	
	false
end

=begin
#################
# Sin el set
################
# @param {Character[][]} board
# @param {String} word
# @return {Boolean}
def exist(board, word)	
	exist_lambda = -> (i, j, pos, used){ #i, j -> Indexes in the board. pos-> position in the word
		if pos >= word.length
			return true 
		elsif i<0 || i >= board.length || j<0 || j>=board[0].length || used.include?([i,j]) || board[i][j] != word[pos]	
			return false
		else # board[i][j] == word[pos]			
			temp = board[i][j]
			board[i][j] = '*'
			found = exist_lambda.(i+1,j,pos+1, used.dup << [i,j]) || exist_lambda.(i-1,j,pos+1,used.dup << [i,j]) || exist_lambda.(i,j+1,pos+1,used.dup << [i,j]) || exist_lambda.(i,j-1,pos+1,used.dup << [i,j])
			board[i][j] = temp
			return found
		end	
	}

	for i in 0..board.length-1
		for j in 0..board[0].length-1
			return true if exist_lambda.(i,j,0, Set.new)
		end
	end	
	false
end
=end
board =
[
  ['A','B','C','E'],
  ['S','F','C','S'],
  ['A','D','E','E']
]

board2 = [	["A","B","C","E"],
			["S","F","E","S"],
			["A","D","E","E"]]
word2 = "ABCESEEEFS"
board3 = [["a","a","a","a"],["a","a","a","a"],["a","a","a","a"],["a","a","a","a"],["a","a","a","b"]]
word3 = "aaaaaaaaaaaaaaaaaaaa"
puts exist(board3, word3)


