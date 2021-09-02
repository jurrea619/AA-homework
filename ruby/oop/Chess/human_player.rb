require_relative 'player'

class HumanPlayer < Player
    attr_reader :name # inherit color, display

    def make_move(board)
        start_pos, end_pos = nil, nil
        # get input from player
        until start_pos && end_pos
            # draw board
            @display.render
            # check if we need both position or just end_pos
            if start_pos
                # need only end position
                puts "#{@name}'s turn(#{@color}). Where do you want to move piece?"
                end_pos = @display.cursor.get_input
                # byebug
                @display.reset if end_pos # erase error messages
            else
                # ask for start_pos of piece to move
                puts "#{name}'s turn(#{@color}). Which piece to move?"
                start_pos = @display.cursor.get_input
                @display.reset if start_pos # erase error messages
            end
        end
        return [start_pos, end_pos] #return move coords
    end
end