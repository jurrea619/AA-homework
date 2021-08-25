class Piece
    attr_accessor :pos
    attr_reader :color, :board
    def initialize(color, board, pos)
        @color, @board, @pos = color, board, pos
    end

    def valid_moves
    end

    def symbol
    end

    def empty?
        return true
    end

    def to_s
        puts @symbol
    end

    def inspect
        self.class.inspect
    end
end