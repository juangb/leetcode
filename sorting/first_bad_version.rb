=begin
First Bad Version

You are a product manager and currently leading a team to develop a new product. Unfortunately, the latest version of your product fails the quality check. Since each version is developed based on the previous version, all the versions after a bad version are also bad.

Suppose you have n versions [1, 2, ..., n] and you want to find out the first bad one, which causes all the following ones to be bad.

You are given an API bool isBadVersion(version) which will return whether version is bad. Implement a function to find the first bad version. You should minimize the number of calls to the API.

Example:

Given n = 5, and version = 4 is the first bad version.

call isBadVersion(3) -> false
call isBadVersion(5) -> true
call isBadVersion(4) -> true

Then 4 is the first bad version. 
=end

# The is_bad_version API is already defined for you.
# @param {Integer} version
# @return {boolean} whether the version is bad
# def is_bad_version(version):




#####################
# Recursive solution O(logn) time and space. Se puede hacer también iterativa con O(1) space
##################
def search(n_min, n_max)
	n = n_min + (n_max - n_min + 1)/2
	if is_bad_version(n)
		return n if !is_bad_version(n-1) 
		search(0,n-1) unless n-1 < 0
	else
		search(n+1,n_max) unless n+1 > n_max
	end	
end

# @param {Integer} n
# @return {Integer}
def first_bad_version(n)
	return search(0,n)
end

