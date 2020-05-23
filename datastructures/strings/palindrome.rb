=begin
Valid Palindrome

Given a string, determine if it is a palindrome, considering only alphanumeric characters and ignoring cases.

Note: For the purpose of this problem, we define empty string as valid palindrome.

Example 1:

Input: "A man, a plan, a canal: Panama"
Output: true

Example 2:

Input: "race a car"
Output: false

=end
require 'set'

# @param {String} s
# @return {Boolean}
def is_palindrome_slower(s)
	s.downcase!
	charSet = [("a".."z"),("0".."9")].map(&:to_a).flatten.to_set
	s_array=[]
    s.chars.each{ |c|
    	s_array.push(c) if charSet.include?(c)
    }
   for i in 0..(s_array.length-1)/2
		return false if s_array[i] != s_array[s_array.length-1-i]
   end
  return true
end

def is_palindrome(s)
	s = s.downcase.tr("^0-9a-z","")
	s == s.reverse
end

puts is_palindrome("A man, a plan, a canal: Panama")
