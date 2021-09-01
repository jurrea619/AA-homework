require_relative 'pieces'

class Board
    attr_accessor :grid
    def initialize(fill = true)
        @null = NullPiece.instance # singleton instance for empty spaces
        build_board(fill)
    end

    # given current colors turn and piece, check move is valid then perform move
    def move_piece(turn_color, start_pos, end_pos)
        raise "No piece at position" if empty?(start_pos)
        raise "Invalid position" if !valid_pos?(end_pos)
        piece = self[start_pos]
        # check that piece being moved is same color as turn color
        if piece.color != turn_color
            raise "Cannot move other color's pieces"
        elsif !piece.moves.include?(end_pos)
            raise "This piece cannot move there"
        # check that piece grabbed can move to end pos
        elsif !piece.valid_moves.include?(end_pos)
            raise "Invalid move. Player would still be in check"
        end
        # update board and update piece's pos
        move_piece!(start_pos, end_pos)
    end

    # method moves pieces without checking. Used also with dup_board
    def move_piece!(start_pos, end_pos)
        piece = self[start_pos]
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

    # check if game is in check for given color
    def in_check?(color)
        # find position of king from input color
        king = find_king(color)
        # see if that position is an available move from other color's pieces
        other_color = color == :white ? :black : :white
        other_color_pcs = all_pieces.select {|p| p.color == other_color}
        other_color_pcs.each do |piece|
            return true if piece.moves.include?(king.pos)
        end
        return false # no piece can reach king, so not in check
    end

    # check if game is in checkmate for given color
    def checkmate?(color)
        if in_check?(color)
          # no valid_moves for player pieces
          colored_pieces(color).each do |piece|
            return false if !piece.valid_moves.empty?
          end
          return true
        else
            return false
        end
    end

    # return king from list of all pieces on board
    def find_king(color)
        all_pieces.find {|p| p.class == King && p.color == color}
    end

    # return deep dup of current board state
    def dup
        dup_board = Board.new(false) # board filled will Null Pieces
        # cycle through all pieces and dup with dup_board
        all_pieces.each do |piece|
            piece.class.new(piece.color, dup_board, piece.pos)
        end
        # return duplicated board
        return dup_board
    end

    private
    attr_reader :null

    # initial set-up for chess board
    def build_board(fill_board)
        @grid = Array.new(8) { Array.new(8,null) }
        return unless fill_board == true
        fill_pawns
        fill_back_rows
    end

    # fill Pawn pieces for both colors in respective rows
    def fill_pawns
        colors = [:white, :black]
        colors.each do |color|
            row = color ==  :white ? 6 : 1
            @grid[row].each_with_index do |pos, col_idx|
                @grid[row][col_idx] = Pawn.new(color, self, [row,col_idx])
            end
        end
    end

    # fill non-Pawn pieces on respective side of board
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

    # return array of all pieces on board
    def all_pieces
        # flatten 2d array and remove all NullPieces
        @grid.flatten.reject {|p| p.empty?}
    end

    # return array of only given color's pieces
    def colored_pieces(color)
        all_pieces.select {|p| p.color == color}
    end
end