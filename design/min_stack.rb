=begin
Min Stack

Design a stack that supports push, pop, top, and retrieving the minimum element in constant time.

    push(x) -- Push element x onto stack.
    pop() -- Removes the element on top of the stack.
    top() -- Get the top element.
    getMin() -- Retrieve the minimum element in the stack.

 

Example 1:

Input
["MinStack","push","push","push","getMin","pop","top","getMin"]
[[],[-2],[0],[-3],[],[],[],[]]

Output
[null,null,null,null,-3,null,0,-2]

Explanation
MinStack minStack = new MinStack();
minStack.push(-2);
minStack.push(0);
minStack.push(-3);
minStack.getMin(); // return -3
minStack.pop();
minStack.top();    // return 0
minStack.getMin(); // return -2

 

Constraints:

    Methods pop, top and getMin operations will always be called on non-empty stacks.

=end

class MinStack

=begin
    initialize your data structure here.
=end
    def initialize()
        @stack = []
        @min_stack = []
    end


=begin
    :type x: Integer
    :rtype: Void
=end
    def push(x)
        @stack.push(x)
        @min_stack.push(x) if @min_stack.empty? || x <= @min_stack.last
    end


=begin
    :rtype: Void
=end
    def pop()
        x = @stack.pop
       	@min_stack.pop if x == @min_stack.last
       		 
        return x
    end


=begin
    :rtype: Integer
=end
    def top()
        @stack.last
    end


=begin
    :rtype: Integer
=end
    def get_min()
        @min_stack.last
    end


end

# Your MinStack object will be instantiated and called as such:
# obj = MinStack.new()
# obj.push(x)
# obj.pop()
# param_3 = obj.top()
# param_4 = obj.get_min()
