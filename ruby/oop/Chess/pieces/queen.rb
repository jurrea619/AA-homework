require_relative 'piece'
require_relative 'slidable'

class Queen < Piece
    include Slidable

    def symbol
        return "Q"
    end

    private
    def move_dirs
        horizontal_dirs + diagonal_dirs
    end
end