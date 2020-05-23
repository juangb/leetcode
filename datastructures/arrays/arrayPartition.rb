=begin
915. Partition Array into Disjoint Intervals
Medium

Given an array A, partition it into two (contiguous) subarrays left and right so that:

    Every element in left is less than or equal to every element in right.
    left and right are non-empty.
    left has the smallest possible size.

Return the length of left after such a partitioning.  It is guaranteed that such a partitioning exists.

 

Example 1:

Input: [5,0,3,8,6]
Output: 3
Explanation: left = [5,0,3], right = [8,6]

Example 2:

Input: [1,1,1,0,6,12]
Output: 4
Explanation: left = [1,1,1,0], right = [6,12]

 

Note:

    2 <= A.length <= 30000
    0 <= A[i] <= 10^6
    It is guaranteed there is at least one way to partition A as described.

=end
 

# @param {Integer[]} a
# @return {Integer}
def partition_disjoint(a)
	minRightValues=[]
	minVal=Float::INFINITY		
	(a.length-1).downto(0){ |i|
		minVal=a[i] if a[i] < minVal
		minRightValues[i]=minVal
	}	
	maxVal=a[0]
	for i in 1..a.length-1		
		return i if maxVal<=minRightValues[i]
		maxVal = a[i] if a[i]>maxVal
	end
	return a.length
end

puts partition_disjoint([1,1,1,0,6,12])
puts partition_disjoint([5,0,3,8,6])



