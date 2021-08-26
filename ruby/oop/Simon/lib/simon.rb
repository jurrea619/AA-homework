require 'byebug'
class Simon
  COLORS = %w(red blue green yellow white)

  attr_accessor :sequence_length, :game_over, :seq

  def initialize
    @sequence_length = 1
    @game_over = false
    @seq = []
  end

  def play
    until game_over
      take_turn
    end
    game_over_message
    reset_game
  end

  def take_turn
    show_sequence
    require_sequence
    round_success_message
    @sequence_length += 1
  end

  def show_sequence
    add_random_color
    @seq.each_with_index do |val, idx|
      # puts each value to screen for a second, then make it vanish
      system("clear")
      puts "Round ##{@sequence_length}: \n"
      puts val if idx.even?
      puts "\t#{val}" if idx.odd?
      sleep(1)
      system("clear")
    end
  end

  def require_sequence
    # ask user for input values
    @seq.each_with_index do |correct_value, idx|
      if idx == 0
        puts "Please enter first value: \n"
      else
        puts "Enter next color: \n"
      end
      begin
      user_guess = gets.chomp
      rescue 
        puts "Sorry, I didn't quite get that."
        retry
      end
        if user_guess != correct_value
        @game_over = true
        break
      end
    end
  end

  def add_random_color
    @seq << COLORS.sample
  end

  def round_success_message
    puts "Round #{@sequence_length} done."
    sleep(1)
  end

  def game_over_message
    puts "Nice try. Game over"
  end

  def reset_game
    @sequence_length = 1
    @game_over = false
    @seq = []
  end
end

if __FILE__ == $PROGRAM_NAME
  game = Simon.new
  game.play
end