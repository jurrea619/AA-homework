require_relative 'piece'
require 'singleton'

class NullPiece < Piece
    include Singleton
    attr_reader :symbol, :color

    def initialize
        @symbol = " "
        @color = :none
    end

    def empty?
        return true
    end

    def moves
        []
    end
    
end