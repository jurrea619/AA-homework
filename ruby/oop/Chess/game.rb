require_relative 'display'
require_relative 'human_player'

class Game
    # initialize new board, display, and players
    def initialize
        @board = Board.new
        @display = Display.new(@board)
        @players = {
            white: HumanPlayer.new("Joshua", :white, @display),
            black: HumanPlayer.new("Megan", :black, @display)
        }
        @current_player = :white
    end

    # gameplay logic. Once game starts, loop until someone is checkmated
    def play
        until @board.checkmate?(@current_player)
            begin
                start_pos, end_pos = @players[@current_player].make_move(@board)
                @board.move_piece(@current_player, start_pos, end_pos)
                swap_turn!
                notify_players # look for check status before next player begins turn
            rescue StandardError => e # catch errors
                @display.user_notifications[:error] = e.message
            end
        end
        # after checkmate
        @display.render
        puts "#{@current_player} is checkmated. Game over"
    end

    private

    # let player know if in check
    def notify_players
        if @board.in_check?(@current_player)
            @display.set_check
        else
            @display.uncheck
        end
    end

    # change players
    def swap_turn!
        @current_player = @current_player == :white ? :black : :white
    end

end

if __FILE__ == $PROGRAM_NAME 
    game = Game.new.play
end