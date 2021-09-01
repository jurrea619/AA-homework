require 'byebug'

class Piece
    attr_accessor :pos
    attr_reader :color, :board
    def initialize(color, board, pos)
        raise "Invalid position" unless board.valid_pos?(pos)
        raise "Invalid color" unless [:white, :black].include?(color)
        
        @color, @board, @pos = color, board, pos
        @board[pos] = self
    end

    def valid_moves
        # reject any possible move that leaves us in check
        moves.reject do |end_pos| 
            move_into_check?(end_pos)
        end
    end

    def symbol
        raise "Not Implemented Yet"
    end

    def empty?
        return false
    end

    def to_s
        return " #{symbol} "
    end

    private
    # method returns true if move leaves player in check
    def move_into_check?(end_pos)
        dup_board = @board.dup
        dup_board.move_piece!(@pos, end_pos)
        dup_board.in_check?(@color)
    end
end