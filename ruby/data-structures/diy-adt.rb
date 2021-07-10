# DIY ADTs homework assignment

class Stack
    def initialize
        # use an underlying array to represent stack
        @arr = []
    end

    def push(el)
      # adds an element to the stack
      arr << el
    end

    def pop
      # removes one element from the stack
      arr.pop
    end

    def peek
      # returns, but doesn't remove, the top element in the stack
      return arr.last
    end

    private
    attr_reader :arr
end

# Stack Testing
# stack = Stack.new
# stack.push(5)
# stack.push(12)
# stack.push(3)
# p stack.pop # return 3
# p stack.peek # return 12


