# @param {Integer} x
# @return {Integer}
def reverse(x)
	digit_array = x.to_s.split("")
	isNeg=false
	if digit_array[0]== "-"
		digit_array.shift
		isNeg = true
	end
	digit_array.reverse!
	digit_array.unshift("-") if isNeg
	number=digit_array.reduce(:+).to_i
	return 0 if( number< -2**31 || number > 2**31 -1)		
	return number	
end

puts reverse(-1230)