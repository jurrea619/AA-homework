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

=begin
stack = Stack.new
stack.push(5)
stack.push(12)
stack.push(3)
p stack.pop # should return 3
p stack.peek # should return 12
=end

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

    # customize inspect value for testing
    def inspect
      queue.inspect
    end

    private
    attr_reader :queue
end

=begin
queue = Queue.new
queue.enqueue("hi")
queue.enqueue("there")
queue.enqueue("bye")
queue.enqueue("now")
p queue
p queue.dequeue # should return "hi"
p queue
p queue.peek    # should return "there"
p queue
=end

# Map Class

class Map
  # initialize underlying 2D array
  def initialize
    @map = Array.new{ [] }
  end

  # updates key-value pair if key exists, else adds new pair to map
  def set(key, value)
    # add pair if map is empty
    if map.empty?
      map << [key, value]
      return
    end

    # if key already exists, update value
    map.each_with_index do |pair,idx|
      if pair[0] == key
        pair[1] = value
        return
      end
    end

    # key doesnt exist, add pair to array
    map << [key,value]
    return
  end

  # retrieve pair with given key, if found
  def get(key)
    map.each do |pair|
      return pair if pair[0] == key
    end
  end

  # delete key-value pair with given key
  def delete(key)
    map.each_with_index do |pair, idx|
      map.delete_at(idx) if pair[0] == key
    end
  end

  def show
    map
  end

  # customize inspect method output for testing
  def inspect
    map.inspect
  end

  private
  attr_reader :map
end  

=begin
map = Map.new
map.set(1,1)
map.set(2,2)
map.set(3,3)
p map.get(2) #[2,2]
map.delete(2)
p map.show # [[1,1], [3,3]]
=end