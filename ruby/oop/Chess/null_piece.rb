require_relative 'piece'
require 'singleton'
class Null_Piece < Piece
    include Singleton
    attr_reader :symbol

    def initialize
        @symbol = " "
    end

    def empty?
        return true
    end

    def moves
        []
    end
    
end