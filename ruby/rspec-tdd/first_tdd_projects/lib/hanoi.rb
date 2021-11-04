
class TowersOfHanoi
    attr_reader :towers

    # new game initialized with array representing 3 towers
    def initialize
        @towers = Array.new(3) { Array.new }
        @towers[0] = [3,2,1]
    end

    def play

    end

    # render tower game to screen using rows.
    def render
       "Tower 0: |#{@towers[0].join(" ")}\n" +
       "Tower 1: |#{@towers[1].join(" ")}\n" + 
       "Tower 2: |#{@towers[2].join(" ")}\n"
    end

    def won?
        if @towers[1] == [3,2,1] || @towers[2] == [3,2,1]
            true
        else
            false
        end
    end
end

if __FILE__ == $PROGRAM_NAME
    game = TowersOfHanoi.new
    game.play
end