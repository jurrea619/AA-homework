require 'byebug'

class PolyTreeNode

    attr_accessor :value, :children
    attr_reader :parent

    # initialize with given value, parent set to nil, and empty children array
    def initialize(value = nil)
        @value = value
        @parent = nil
        @children = []
    end

    # set parent property and add node to parent's array of children
    # unless setting parent to nil
    def parent=(new_parent)
        # if new_parent is the same as current, then return
        return if self.parent == new_parent

        # detach current node from parents children before changing parent
        if self.parent
            self.parent.children.delete(self)
        end

        # if parent is nil, update value and return
        if new_parent.nil?
            @parent = nil
        else    
            # else, set new value and add to parent's children array
            @parent = new_parent
            # add self to new_parent's children array
            self.parent.children << self
        end
    end

    # add child. Method calls parent=() method which does most work
    def add_child(child_node)
        child_node.parent = self
    end

    # remove child from children, if given node is a child
    def remove_child(child_node)
        if !child_node.nil? && !self.children.include?(child_node)
            raise "Node not a child"
        else 
            child_node.parent = nil
        end
    end

=begin
   Phase 4: Searching
Write a #dfs(target_value) method which takes a value to search for and performs the search. Write this recursively.
First, check the value at this node. If a node's value matches the target value, return the node.
If not, iterate through the #children and repeat.
Write a #bfs(target_value) method to implement breadth first search.
You will use a local Array variable as a queue to implement this.
First, insert the current node (self) into the queue.
Then, in a loop that runs until the array is empty:
Remove the first node from the queue,
Check its value,
Push the node's children to the end of the array.
Prove to yourself that this will check the nodes in the right order. Draw it out. Show this explanation to your TA.    
=end

    # dfs method takes a target value to search for and performs search recursively
    def dfs(target_value)
        # base case, return this node if value matches target
        return self if self.value == target_value
    
        # iterate through children and repeat
        self.children.each do |child|
            result = child.dfs(target_value)
            return result unless result.nil?
        end
        # all children searched and target not found, return nil
        nil
    end


    def inspect
        self.value.inspect
    end
end

if __FILE__ == $PROGRAM_NAME
    node1 = PolyTreeNode.new(1)
    node2 = PolyTreeNode.new(2)
    node2.parent = node1
    node1.dfs(2)
end