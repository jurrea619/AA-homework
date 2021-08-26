require_relative 'piece'
require_relative 'slidable'

class Rook < Piece
    include Slidable

    def symbol
        return "R"
    end

    private
    def move_dirs
        horizontal_dirs
    end
end