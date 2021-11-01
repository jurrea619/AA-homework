
class TowersOfHanoi
    attr_reader :towers

    def initialize
        @towers = Array.new(3) { Array.new }
        @towers[0] = [5,4,3,2,1]
        render
    end

    # render tower game to screen using rows.
    def render
        system("clear")
        puts "\tTowers of Hanoi\n"
        @towers.each_with_index do |row, idx|
            puts "Tower #{idx+1}:\t|#{row.join(" ")}"
        end
    end
end

if __FILE__ == $PROGRAM_NAME
    game = TowersOfHanoi.new
end