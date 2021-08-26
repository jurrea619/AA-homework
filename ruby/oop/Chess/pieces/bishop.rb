require_relative 'piece'
require_relative 'slidable'

class Bishop < Piece
    include Slidable

    def symbol
        return "B"
    end

    private
    def move_dirs
        diagonal_dirs
    end
end