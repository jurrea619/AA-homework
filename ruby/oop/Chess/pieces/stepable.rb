module Stepable
    # calculate moves for pieces that step, King and Knight
    def moves
        possible_moves = []
        # move diffs array shows change in x and y
        move_diffs.each do |dx,dy|
            x, y = pos # current position
            # add move_diffs to current position
            new_pos = [x + dx, y + dy]
            # skip if not valid position on board (off grid)
            next unless board.valid_pos?(new_pos)
            # check if empty, if so add to possible moves
            if board[new_pos].empty?
                possible_moves << new_pos
            # if not empty, add to possible moves if piece is opposite color
            elsif board[new_pos].color != self.color
                possible_moves << new_pos
            end
        end
        possible_moves #return all moves
    end

    # overwritten by subclass, otherwise raise error
    def move_diffs
        raise "Move diffs not yet implemented"
    end
end