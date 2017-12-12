require 'singleton'
require_relative 'modules'

class Piece
  def initialize(pos, board)
    @pos = pos
    @board = board
  end

  def moves
    []
  end

  def symbol
    "T"
  end
end

class NullPiece < Piece
  include Singleton
  def initialize
    puts "Initialized a new NullPiece"
  end

  def moves
    []
  end
end

class Rook < Piece
  include SlidingPiece

  def symbol
    "♜"
  end
end

#CHESS PIECE EMOJI ASCII:
#http://www.i2symbol.com/symbols/chess
