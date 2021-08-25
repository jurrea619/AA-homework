class Piece
    attr_accessor :pos
    def initialize(color, board, pos)
        @color, @board, @pos = color, board, pos
    end

    def inspect
        self.class.inspect
    end
end