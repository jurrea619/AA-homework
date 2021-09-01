require_relative 'piece'

class Pawn < Piece
    def symbol
        return "♟︎"
    end

    def moves
        forward_steps + side_attacks
    end

    private

    # return true if pawn is at initial row, depending on color
    def at_start_row?
        if color == :white
            return true if pos[0] == 6
            return false
        else
            return true if pos[0] == 1
            return false
        end
    end

    # returns 1 or -1, depending on which color
    def forward_dir
        color == :white ? -1 : 1
    end

    def forward_steps
        # logic for taking forward steps
        x, y = pos
        one_step_forward = [x + forward_dir, y]
        # no forward move possible if pawn cannot move forward
        return [] unless board.valid_pos?(one_step_forward) && board.empty?(one_step_forward)
        possible_steps = [one_step_forward]
        # check if pawn can take 2 steps
        two_steps = [x + 2 * forward_dir, y]
        possible_steps << two_steps if at_start_row? && board.empty?(two_steps)
        possible_steps
    end

    def side_attacks
        # logic for side attacks
        x, y = pos
        possible_moves = []
        side_attack_positions = [[x + forward_dir, y - 1] , [x + forward_dir, y + 1]]
        side_attack_positions.each do |new_pos|
            next if !board.valid_pos?(new_pos) || board.empty?(new_pos)
            piece = board[new_pos]
            possible_moves << new_pos if piece.color != self.color
        end
        possible_moves
    end
end