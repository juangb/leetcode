=begin
Given an array, rotate the array to the right by k steps, where k is non-negative.

Follow up:

    Try to come up as many solutions as you can, there are at least 3 different ways to solve this problem.
    Could you do it in-place with O(1) extra space?

 

Example 1:

Input: nums = [1,2,3,4,5,6,7], k = 3
Output: [5,6,7,1,2,3,4]
Explanation:
rotate 1 steps to the right: [7,1,2,3,4,5,6]
rotate 2 steps to the right: [6,7,1,2,3,4,5]
rotate 3 steps to the right: [5,6,7,1,2,3,4]

Example 2:

Input: nums = [-1,-100,3,99], k = 2
Output: [3,99,-1,-100]
Explanation: 
rotate 1 steps to the right: [99,-1,-100,3]
rotate 2 steps to the right: [3,99,-1,-100]

 

Constraints:

    1 <= nums.length <= 2 * 10^4
    It's guaranteed that nums[i] fits in a 32 bit-signed integer.
    k >= 0

=end


######################
# Simple answer but not in place
#########################
# @param {Integer[]} nums
# @param {Integer} k
# @return {Void} Do not return anything, modify nums in-place instead.
def rotate2(nums, k)
	return nums[nums.length-k..nums.length-1].concat(nums[0..nums.length-1-k])
end

#####################3
# Simple answer in place. Several passes.TAKES TOO LONG
##########################
# @param {Integer[]} nums
# @param {Integer} k
# @return {Void} Do not return anything, modify nums in-place instead.
def rotate3(nums, k)	
	k=k%nums.length
	for i in 1..k
		temp=nums[nums.length-1]
		(nums.length-1).downto(1).each{ |j|
			nums[j]=nums[j-1]
		}
		nums[0]=temp		
	end
end

#############################33
# REVERSING ARRAY AND REVESING SUBARRAYS
##############################
def reverse(nums,startIndex,endIndex)	
	while(startIndex<endIndex)
		nums[startIndex],nums[endIndex]=nums[endIndex],nums[startIndex] #swap
		startIndex+=1
		endIndex-=1
	end
end
def rotate(nums, k)	
	return if nums.nil?
	k=k%nums.length
	nums.reverse!
	reverse(nums,0,k-1)
	reverse(nums,k,nums.length-1)
end

arr=[1]
rotate(arr,3)

puts arr.to_s

