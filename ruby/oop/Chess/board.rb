require_relative 'pieces'
class Board
    attr_accessor :grid
    def initialize
        @null = NullPiece.instance # singleton instance for empty spaces
        fill_board
    end

    def move_piece(turn_color, start_pos, end_pos)
        raise "No piece at position" if empty?(start_pos)
        raise "Cannot move piece there" if !valid_pos?(end_pos)

        # check that piece being moved is same color as turn color
        # check that piece grabbed can move to end pos
        piece = self[start_pos]
        raise "Cannot move other color's pieces" if piece.color != turn_color
        raise "Piece cannot move there" if !piece.valid_moves.include?(end_pos)
        # update board and update piece's pos
        self[start_pos] = null
        self[end_pos] = piece
        piece.pos = end_pos
    end

    # getter method
    def [](pos)
        raise "Invalid position" if !valid_pos?(pos)
        x, y = pos
        @grid[x][y]
    end

    # setter method
    def []=(pos, piece)
        raise "Invalid position" if !valid_pos?(pos)
        x, y = pos
        @grid[x][y] = piece
    end

    # check that position is on board
    def valid_pos?(pos)
        pos.all? {|val| val.between?(0,7)}
    end

    # check if position is empty
    def empty?(pos)
        self[pos].empty?
    end

    private
    attr_reader :null
    def fill_board
        @grid = Array.new(8) { Array.new(8,null) }
        fill_pawns
        fill_back_rows
    end

    def fill_pawns
        colors = [:white, :black]
        colors.each do |color|
            row = color ==  :white ? 6 : 1
            @grid[row].each_with_index do |pos, col_idx|
                @grid[row][col_idx] = Pawn.new(color, self, [row,col_idx])
            end
        end
    end

    def fill_back_rows
        colors = [:white, :black]
        piece_classes = [Rook, Knight, Bishop, Queen, King, Bishop, Knight, Rook]
        colors.each do |color|
            row = color == :white ? 7 : 0
            @grid[row].each_with_index do |pos, col_idx|
                @grid[row][col_idx] = piece_classes[col_idx].new(color, self, [row,col_idx])
            end
        end
    end
end