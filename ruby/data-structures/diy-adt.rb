# DIY ADTs homework assignment

class Stack

    # use an underlying array to represent stack
    def initialize
      @arr = []
    end

    # adds an element to the stack
    def push(el)
      arr << el
    end

    # removes one element from the stack
    def pop
      arr.pop
    end

    # view next element in stack
    def peek
      return arr.last
    end

    private
    attr_reader :arr
end

# stack = Stack.new
# stack.push(5)
# stack.push(12)
# stack.push(3)
# p stack.pop # return 3
# p stack.peek # return 12


# Queue class
class Queue

    # initialize underlying array to represent queue
    def initialize
      @queue = []
    end

    # add element to queue
    def enqueue(el)
      queue << el
    end

    # remove element from front of queue
    def dequeue
      queue.shift
    end

    # view next element in queue
    def peek
      queue.first
    end

    # customize inspect return value
    def inspect
      queue.inspect
    end

    private
    attr_reader :queue
end

# queue = Queue.new
# queue.enqueue("hi")
# queue.enqueue("there")
# queue.enqueue("bye")
# queue.enqueue("now")
# p queue
# p queue.dequeue
# p queue
# p queue.peek
# p queue


