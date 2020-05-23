=begin
Merge Intervals

Given a collection of intervals, merge all overlapping intervals.

Example 1:

Input: [[1,3],[2,6],[8,10],[15,18]]
Output: [[1,6],[8,10],[15,18]]
Explanation: Since intervals [1,3] and [2,6] overlaps, merge them into [1,6].

Example 2:

Input: [[1,4],[4,5]]
Output: [[1,5]]
Explanation: Intervals [1,4] and [4,5] are considered overlapping.

NOTE: input types have been changed on April 15, 2019. Please reset to default code definition to get new method signature.

=end
# @param {Integer[][]} intervals
# @return {Integer[][]}
def merge(intervals)
	return [] if intervals.nil? || intervals.empty?
	
	intervals.sort_by!(&:first)
	merged_i = [intervals[0]]
	intervals.each{ |i|
		if i[0] <= merged_i.last[1]
			merged_i.last[1] = [i[1], merged_i.last[1]].max
		else
			merged_i.push(i)
		end			
	}
	merged_i
end

i = [[1,3],[8,10],[15,18],[2,6]]
puts merge(i).to_s
