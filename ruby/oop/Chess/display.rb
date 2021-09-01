require 'colorize'
require_relative 'cursor.rb'
require_relative 'board'

class Display
    attr_reader :board, :cursor

    def initialize(board)
        @board = board
        @cursor = Cursor.new([0,0], board)
        loop do
            render
            @cursor.get_input
        end
    end

    def render
        system("clear")
        puts "Use arrow keys or WASD to move, enter/space to confirm"
        build_grid
    end

    private
    def build_grid
        # iterate through rows and build square by square
        @board.grid.each_with_index do |row, i|
            build_row(row, i)
        end
        # add lower row col symbols
        column_labels
        puts
    end

    def build_row(row, row_idx)
        print (8-row_idx) # row numbers
        # iterate through each row piece by piece
        row.each_with_index do |piece, col_idx|
        # call to_s method for each, coloring dependant on coord pos
            square_color = get_square_color([row_idx,col_idx])
            print piece.to_s.colorize(:color => piece.color, :background => square_color)
        end
        puts
    end

    # add labels at bottom row
    def column_labels
        print " "
        ('a'..'h').each do |col|
            print " #{col} "
        end
    end

    def get_square_color(pos)
        if @cursor.cursor_pos == pos && @cursor.selected
            background = :green
        elsif @cursor.cursor_pos == pos # cursor position, not selected
            background = :light_yellow
        elsif (pos[0] + pos[1]).odd?
            background = :light_blue
        else # pos even
            background = :light_red
        end
        return background
    end

end

# Used for testing purposes
if __FILE__ == $PROGRAM_NAME
  d = Display.new(Board.new)
end