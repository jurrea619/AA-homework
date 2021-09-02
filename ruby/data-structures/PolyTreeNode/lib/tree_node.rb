=begin
    PolyTreeNode assignment used as an exercise to understand the implementation
    of trees and the two respective searches used for traversing a tree, BFS/DFS    
=end
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
        # if new_parent is already same as current parent, then return
        return if self.parent == new_parent

        # detach current node from parent's children array before changing
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

    # bfs method takes target_value and performs search using array as queue
    def bfs(target_value)
        # initialize underlying array, add self
        queue = []
        queue << self

        # loop that will check nodes for target value in order of queue
        until queue.empty? do
            node = queue.shift
            return node if node.value == target_value
            node.children.each do |child|
                queue << child
            end
        end
    end

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