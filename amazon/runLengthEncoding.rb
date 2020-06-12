
# Returns the "run length encoding" of a given string
# Ex: "aaaabbccca" -> 4a2b3c1a
# @param {String} input
# @return {String} 
def encode(input)
	return "" if input.nil? || input.length==0
	
	result = []
	count=1
	for i in 1..input.length-1
		if input[i-1] != input[i]
			result << count.to_s + input[i-1]
			count = 1
		else
			count += 1
		end
	end
	result << count.to_s + input[-1]
	result.join
end

# Returns the "run length encoding" of a given string
# Ex: "aaaabbccca" -> 4a2b3c1a
# @param {String} input
# @return {String} 
def encode2(input)
	#Check for null input
	return "" if input.nil? || input.length==0
	
	input.chars.chunk {|c| c}
		.collect { |c, c_array|
			[c_array.length, c]
		}.join
		
end

# @param {String} input
# @return {String}
def decode(input)
	#Check for null input or malformed string
	return "" if input.nil? || input.length==0 || input.length.odd?
	
	input.chars.each_slice(2).to_a.collect{|ary| 
		ary[1] * ary[0].to_i		
	}.join
end


p encode2("aaaabbcccd")
p decode("4a2b3c1d")