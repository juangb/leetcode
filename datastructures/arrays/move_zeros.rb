=begin
Move Zeroes

Given an array nums, write a function to move all 0's to the end of it while maintaining the relative order of the non-zero elements.

Example:

Input: [0,1,0,3,12]
Output: [1,3,12,0,0]

Note:

    You must do this in-place without making a copy of the array.
    Minimize the total number of operations.
=end

# @param {Integer[]} nums
# @return {Void} Do not return anything, modify nums in-place instead.

###################
# Lo he hecho cambiando el orden. Tiene que mantenerlo
#############3
def move_zeroes(nums)
	startIndex=0
	endIndex=nums.length-1
	while startIndex < endIndex
		if nums[startIndex]==0
			endIndex -=1 while nums[endIndex]==0 && startIndex < endIndex
			nums[startIndex], nums[endIndex] = nums[endIndex], nums[startIndex] #swap	
		end
		startIndex += 1
	end
end


###################
# Mantener orden
#############3
def move_zeroes(nums)
	i, offset = 0, 0
	while i+offset < nums.length
		offset+=1	while i+offset < nums.length-1 && nums[i+offset]==0
		nums[i], nums[i+offset] = nums[i+offset], nums[i] #swap
		i += 1
	end
end


arr=[0,1,0,3,12]
move_zeroes(arr)
puts arr.to_s
