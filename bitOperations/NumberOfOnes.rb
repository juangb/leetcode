=begin
Write a function that takes an unsigned integer and return the number of '1' bits it has (also known as the Hamming weight).
=end

# @param {Integer} n, a positive integer
# @return {Integer}
def hamming_weight(n)
	weight=0
	while(n!=0) do
		weight += n&1
		n = n >> 1
	end
	return weight
end