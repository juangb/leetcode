=begin
  Count Primes

Count the number of prime numbers less than a non-negative number, n.

Example:

Input: 10
Output: 4
Explanation: There are 4 prime numbers less than 10, they are 2, 3, 5, 7.

TIP: The Sieve of Eratosthenes is one of the most efficient ways to find all prime numbers up to n.
=end

# @param {Integer} n
# @return {Integer}
def count_primes(n)
	is_prime = Array.new(n)
	is_prime[0] = 0
	is_prime[1] = 0
	
	# Optimization: the terminating loop condition can be p < √n, as all non-primes ≥ √n 
	# must have already been marked off. Then marke all "nil" values as prime numbers
	n_sqrt = Math.sqrt(n).to_i
	for i in 2..n_sqrt
		is_prime[i] = 1 if is_prime[i].nil?
		#Mark primes
		if is_prime[i]
			j=i
			while i*j < n
				is_prime[i*j] = 0
				j += 1
			end
		end
	end
	return is_prime.map!{ |n| n.nil? ? 1 : n}.reduce(:+)
end

#######
# Simple "cheating" solution
##########
require 'prime'
def count_primes(n)
    Prime.each(n-1).count
end



puts count_primes(15).to_s
