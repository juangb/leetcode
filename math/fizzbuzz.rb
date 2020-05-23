=begin
Fizz Buzz

Write a program that outputs the string representation of numbers from 1 to n.

But for multiples of three it should output “Fizz” instead of the number and for the multiples of five output “Buzz”. For numbers which are multiples of both three and five output “FizzBuzz”.

Example:

n = 15,

Return:
[
    "1",
    "2",
    "Fizz",
    "4",
    "Buzz",
    "Fizz",
    "7",
    "8",
    "Fizz",
    "Buzz",
    "11",
    "Fizz",
    "13",
    "14",
    "FizzBuzz"
]
=end

def to_s_fb(n)	
	return "FizzBuzz" if n % 15 == 0		
	return "Fizz" if n % 3 == 0
	return "Buzz" if n % 5 == 0
	return n.to_s		
end

# @param {Integer} n
# @return {String[]}
def fizz_buzz(n)
	rep_array = Array.new(n)
	for i in 1..n
		rep_array[i-1] = to_s_fb(i)
	end
	return rep_array
end

puts fizz_buzz(16).to_s
