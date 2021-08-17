class Board
  attr_reader :cups

  # initialize underlying array and set-up for initial move
  def initialize(name1, name2)
    @cups = Array.new(14) { Array.new(0) }
    @name1, @name2 = name1, name2
    place_stones
  end

  # helper method to #initialize every non-store cup with four stones each
  def place_stones
    # iterate through array and place 4 stones in all cups, except player stores
    @cups.each_with_index do |cup, idx|
      unless (idx == 6 || idx == 13)
        4.times do
          cup << :stone
        end
      end
    end
  end

  # return true if given index is neither empty or a player store, else raise error
  def valid_move?(start_pos)
    raise "Invalid starting cup" if (start_pos == 6 || start_pos >= 13)
    raise "Starting cup is empty" if @cups[start_pos].empty?
    return true
  end

  def make_move(start_pos, current_player_name)
    # before making move, check that player is on right side of board
    stones_in_hand = @cups[start_pos] # store array of stones
    @cups[start_pos] = [] # empty start_pos cup 
    current_pos = start_pos
      # until hands empty, increment current position, and add stone to board position
    until stones_in_hand.empty?
      current_pos += 1
      current_pos = current_pos % 14 # reset counter
      unless (current_pos == 6 && current_player_name == @name2 ||
              current_pos == 13 && current_player_name == @name1)
        @cups[current_pos] << stones_in_hand.pop
      end
    end
    self.render # render after every turn finishes
    next_turn(current_pos)
  end

  # helper method to determine whether #make_move returns :switch, :prompt, or ending_cup_idx
  def next_turn(ending_cup_idx)
    return :prompt if ending_cup_idx == 6 || ending_cup_idx == 13
    return :switch if @cups[ending_cup_idx].count == 1
    return ending_cup_idx
  end

  # render board
  def render
    print "      #{@cups[7..12].reverse.map { |cup| cup.count }}      \n"
    puts "#{@cups[13].count} -------------------------- #{@cups[6].count}"
    print "      #{@cups.take(6).map { |cup| cup.count }}      \n"
    puts ""
    puts ""
  end

  # helper method to identify if either row is empty of stones
  def one_side_empty?
    return true if (@cups.take(5).all? {|cup| cup.empty? } ||
                    @cups[7..12].all? {|cup| cup.empty? } )
    return false
  end

  # return name of winner with most stones in respective cup, :draw otherwise
  def winner
    count1, count2 = @cups[6].count, @cups[13].count
    if count1 > count2
      @name1
    elsif count2 > count1
      @name2
    else
      :draw
    end
  end
end
