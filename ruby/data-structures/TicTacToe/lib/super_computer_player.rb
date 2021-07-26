require_relative 'tic_tac_toe_node'
=begin
  SuperComputerPlayer is an extension of ComputerPlayer that uses the TicTacToeNode
  class search in all possible moves from current state in order to win or avoid
    a loss as much as possible
=end
class SuperComputerPlayer < ComputerPlayer
  def move(game, mark)
    # create node with given game and mark 
    node = TicTacToeNode.new(game.board, mark)
    # if any child node of current state winning node, return prev_move_pos
    node.children.each do |child_node|
      return child_node.prev_move_pos if child_node.winning_node?(mark)
    end
    # no winning node, so find random node that does not lose us game
    shuffled_moves = node.children
    shuffled_moves.each do |node|
      return node.prev_move_pos if !node.losing_node?(mark)
    end
    # raise error if no moves will avoid loss
    raise "No non-losing nodes :/"
  end
end

if __FILE__ == $PROGRAM_NAME
  puts "Play the brilliant computer!"
  hp = HumanPlayer.new("Joshua")
  cp = SuperComputerPlayer.new

  TicTacToe.new(hp, cp).run
end
