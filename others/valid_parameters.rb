=begin
Valid Parentheses

Given a string containing just the characters '(', ')', '{', '}', '[' and ']', determine if the input string is valid.

An input string is valid if:

    Open brackets must be closed by the same type of brackets.
    Open brackets must be closed in the correct order.

Note that an empty string is also considered valid.

=end

# @param {String} s
# @return {Boolean}
def is_valid(s)
	mapping = { '(' => ')', '{' => '}', '[' => ']' }
	stack=[]
	s.each_char{ |c|
		if mapping.key?(c)
			stack.push(c) 
		else
			return false if stack.empty? || mapping[stack.pop] != c
		end		
	}
	return stack.empty?
end

