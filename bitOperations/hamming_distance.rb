=begin
The Hamming distance between two integers is the number of positions at which the corresponding bits are different.

Given two integers x and y, calculate the Hamming distance.

Note:
0 ≤ x, y < 231.

Example:

Input: x = 1, y = 4

Output: 2

Explanation:
1   (0 0 0 1)
4   (0 1 0 0)
       ↑   ↑

The above arrows point to positions where the corresponding bits are different.

=end

# @param {Integer} x
# @param {Integer} y
# @return {Integer}
def hamming_distance(x, y)
	#Do XOR and count number of bits
	xor = x^y
	num_ones =0
	while xor > 0
		num_ones += xor & 1 #I could also do xor%2
		xor >>= 1
	end
	return num_ones	
end


#######
# One line solution. It counts number of bits in a different way
#######
def hamming_distance(x, y)
	(x^y).to_s(2).count("1")
end

