=begin
Merge Sorted Array

Given two sorted integer arrays nums1 and nums2, merge nums2 into nums1 as one sorted array.

Note:

    The number of elements initialized in nums1 and nums2 are m and n respectively.
    You may assume that nums1 has enough space (size that is greater or equal to m + n) to hold additional elements from nums2.

Example:

Input:
nums1 = [1,2,3,0,0,0], m = 3
nums2 = [2,5,6],       n = 3

Output: [1,2,2,3,5,6]
=end

#########################################
# Solución desplazando todos los elementos del array1 a la derecha cada vez que añadimos
#########################################
# @param {Integer[]} nums1
# @param {Integer} m
# @param {Integer[]} nums2
# @param {Integer} n
# @return {Void} Do not return anything, modify nums1 in-place instead.
def merge_slow(nums1, m, nums2, n)
	i1 = i2 = 0
	until i1 + i2 >= m + n
		if i2 >= n
			return
		elsif i1 >= m
			nums1[i1 + i2] = nums2[i2]
			i2 += 1
		elsif nums1[i1+i2] <= nums2[i2]
			i1 += 1
		else
			#Shift elements			
			temp = nums1[i1+i2]
			for j in (i1+i2+1)..(nums1.length-1)	
				nums1[j], temp = temp, nums1[j]
			end
			nums1[i1+i2] = nums2[i2]
			i2 += 1
		end
	end
end

#########################
# Más inteligente. Empezar por el final
############################
# @param {Integer[]} nums1
# @param {Integer} m
# @param {Integer[]} nums2
# @param {Integer} n
# @return {Void} Do not return anything, modify nums1 in-place instead.
def merge(nums1, m, nums2, n)
	i1 = m-1
	i2 = n-1
	count = m + n - 1
	while count >= 0
		return if i2 < 0
		if i1 >=0 && nums1[i1] > nums2[i2]
			nums1[count] = nums1[i1]
			i1 -= 1
		else
			nums1[count] = nums2[i2]
			i2 -= 1
		end
		count -= 1
	end
end

nums1 = [1,2,3,8,9,10]
m = 3
nums2 = [2,5,6]
n = 3
merge(nums1, m, nums2, n)
puts nums1.to_s


nums1=[4,0,0,0,0,0]
m=1
nums2=[1,2,3,5,6]
n=5
merge(nums1, m, nums2, n)
puts nums1.to_s