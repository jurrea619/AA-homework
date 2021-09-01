module Slidable

    # constants showing changes for coord in direction
    HORIZONTAL_DIRS = [
        [0,1],
        [1,0],
        [0,-1],
        [-1,0]
        ].freeze # freeze to make constant not adjustable

    DIAGONAL_DIRS = [
        [1,1],
        [-1,-1],
        [1,-1],
        [-1,1]
    ].freeze

    # slides only vertical/horizontal
    def horizontal_dirs
        HORIZONTAL_DIRS
    end

    # slides diagonally
    def diagonal_dirs
        DIAGONAL_DIRS
    end

    # calculate possible moves for current piece
    def moves
        total_moves = []
        # grow each move unblocked in each possible dir, and add to possible moves
        move_dirs.each do |dx,dy|
           total_moves.concat(grow_unblocked_moves_in_dir(dx,dy))
        end
        total_moves
    end

    private
    
    # overwritten by subclass
    def move_dirs
        raise "Move dirs not yet implemented"
    end

    # calculate possible moves in each dir unblocked
    def grow_unblocked_moves_in_dir(dx,dy)
        possible_moves = []
        x, y = pos
        new_pos = [x + dx, y + dy]
        # if new position valid and empty, add to possible moves and continue sliding piece
        until !board.valid_pos?(new_pos) || !board.empty?(new_pos) do
            possible_moves << new_pos
            # continue moving in direction [dx,dy]
            new_pos = [new_pos[0] + dx, new_pos[1] + dy] 
        end
        # if position valid, then position not empty
        # check if piece is other color, if so add to possible moves
        if board.valid_pos?(new_pos) && board[new_pos].color != self.color
            possible_moves << new_pos
        end
        possible_moves
    end

end