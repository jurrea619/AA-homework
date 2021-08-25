require_relative 'pieces'
require 'byebug'
class Board
    attr_accessor :grid
    def initialize
        fill_board
    end

    def move_piece(start_pos, end_pos)
        raise "No piece at position" if self[start_pos].nil?
        raise "Cannot move piece there" if !self[end_pos].nil?
        # update board and update piece's pos
        piece = self[start_pos]
        self[start_pos] = nil
        self[end_pos] = piece
        piece.pos = end_pos
    end

    def [](pos)
        raise "Invalid position" if !valid_pos?(pos)
        x, y = pos
        @grid[x][y]
    end

    def []=(pos, piece)
        raise "Invalid position" if !valid_pos?(pos)
        x, y = pos
        @grid[x][y] = piece
    end

    def valid_pos?(pos)
        pos.all? {|val| val.between?(0,7)}
    end

    private
    def fill_board
        @grid = Array.new(8) { Array.new(8){[]} }
        fill_pawns
        fill_back_rows
        fill_null_pieces
    end

    def fill_pawns
        colors = [:white, :black]
        colors.each do |color|
            row = color ==  :white ? 6 : 1
            @grid[row].each_with_index do |pos, col_idx|
                @grid[row][col_idx] = Piece.new(color, self, [row,col_idx])
            end
        end
    end

    def fill_back_rows
        colors = [:white, :black]
        colors.each do |color|
            row = color == :white ? 7 : 0
            @grid[row].each_with_index do |pos, col_idx|
                @grid[row][col_idx] = Piece.new(color, self, [row,col_idx])
            end
        end
    end

    def fill_null_pieces
        (2..5).each do |row|
            @grid[row].each_with_index do |pos, col_idx|
                @grid[row][col_idx] = nil
            end
        end
    end
end