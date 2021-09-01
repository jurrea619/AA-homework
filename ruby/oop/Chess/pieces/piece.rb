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
        moves
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

    # def inspect
    #     # self.class.inspect
    #     to_s.inspect
    # end
end