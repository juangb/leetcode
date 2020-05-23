=begin
 Best Time to Buy and Sell Stock

Say you have an array for which the ith element is the price of a given stock on day i.

If you were only permitted to complete at most one transaction (i.e., buy one and sell one share of the stock), design an algorithm to find the maximum profit.

Note that you cannot sell a stock before you buy one.

Example 1:

Input: [7,1,5,3,6,4]
Output: 5
Explanation: Buy on day 2 (price = 1) and sell on day 5 (price = 6), profit = 6-1 = 5.
             Not 7-1 = 6, as selling price needs to be larger than buying price.

Example 2:

Input: [7,6,4,3,1]
Output: 0
Explanation: In this case, no transaction is done, i.e. max profit = 0.

=end
##############################
#  Using O(n) extra space. Three passes
##############################

# @param {Integer[]} prices
# @return {Integer}
def max_profit2(prices)
	return 0 if prices.nil? || prices.length < 2
	min_prices = Array.new(prices.length)
	max_prices = Array.new(prices.length)
	#Min prices
	min_prices[0] = prices[0]
	for i in 1..prices.length-1
		min_prices[i] = [prices[i], min_prices[i-1]].min
	end
	#Max prices
	max_prices[prices.length-1] = prices[prices.length-1]
	(prices.length-2).downto(0){ |i|
		max_prices[i] = [prices[i], max_prices[i+1]].max
	}
	max=0
	for i in 0..prices.length-1
		max = [max, max_prices[i]-min_prices[i]].max
	end
	return max
end

#########################
# Using O(1) extra space. One pass
###########################
def max_profit(prices)
	return 0 if prices.nil? || prices.length < 2
	
	min_price = prices[0]
	max_profit = 0
	
	for i in 1..prices.length - 1
		max_profit = [prices[i] - min_price , max_profit].max
		min_price = [prices[i], min_price].min
	end
	return max_profit
end

puts max_profit([7,1,5,3,6,4])
