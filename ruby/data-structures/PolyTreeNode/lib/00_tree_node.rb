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

end
