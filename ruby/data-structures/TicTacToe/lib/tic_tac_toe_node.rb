require_relative 'tic_tac_toe'
require 'byebug'

class TicTacToeNode

  attr_reader :board, :next_mover_mark, :prev_move_pos

  def initialize(board, next_mover_mark, prev_move_pos = nil)
    @board = board
    @next_mover_mark = next_mover_mark
    @prev_move_pos = prev_move_pos
  end

  # method to check if current state is lost, or could still lose
  def losing_node?(evaluator)
    # if board is over AND winner is not us, we lost
    if board.over?
      return true if board.won? && board.winner != evaluator
      return false
    end

    # if our turn, check if all children are losing nodes
    if next_mover_mark == evaluator
      children.all? { |node| node.losing_node?(evaluator) }
    else  # other player's turn, ONE of nodes children is a possible losing node
      children.any? { |node| node.losing_node?(evaluator) }
    end
  end


  def winning_node?(evaluator)
    # if game over and current player is winner, return true. False otherwise
    if board.over?
      return true if board.won? && board.winner == evaluator
      return false
    end

    # if our turn, true if any child is winning node.
    if next_mover_mark == evaluator
      children.any? { |node| node.winning_node?(evaluator)}
    else # other players turn, true if all children are winning nodes
      children.all? { |node| node.winning_node?(evaluator)}
    end
  end

  # This method generates an array of all moves that can be made after
  # the current move.
  def children
    all_possible_moves = [] # initialize array to hold moves

    # iterate through all positions that are empty?
    (0..2).each do |row|
      (0..2).each do |col|
        current_pos = [row,col]
        # byebug
        # skip position if not empty
        next unless board.empty?(current_pos)
        # at each empty position, create node by dup'ing board, and put next_mover_mark
        dup_board = board.dup
        dup_board[current_pos] = self.next_mover_mark
        next_mover_mark = (self.next_mover_mark == :x ? :o : :x)
        all_possible_moves << TicTacToeNode.new(dup_board, next_mover_mark, current_pos)
      end
    end
    all_possible_moves # return all moves
  end
end
