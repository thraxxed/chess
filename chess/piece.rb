require 'singleton'
require_relative 'modules'
require 'colorize'

class Piece
  #attr_reader :player

  def initialize(pos, board, player)
    #@player should be 1 or 2
    @player = player
    @pos = pos
    @board = board
  end

  def player
    @player
  end


  def valid_moves
    self.moves
  end

  def symbol
    "T"
  end
end

class NullPiece < Piece
  include Singleton
  def initialize
    @player = nil
    puts "Initialized a new NullPiece"
  end

  def moves
    []
  end
end

class Rook < Piece
  include SlidingPiece

  def symbol
    return "♜".blue if @player == 2
    "♜".red if @player == 1
  end

  protected

  def move_dirs
    horizontal_dirs + vertical_dirs
    # [:horizontal, :vertical]
  end
end

class Bishop < Piece
  include SlidingPiece

  def symbol
    return "♝".blue if @player == 2
    "♝".red if @player == 1
  end

  protected

  def move_dirs
    diagonal_dirs
    # [:diagonal]
  end
end

class Queen < Piece
  include SlidingPiece

  def symbol
    return "♚".blue if @player == 2
    "♚".red if @player == 1
  end

  protected

  def move_dirs
    horizontal_dirs + vertical_dirs + diagonal_dirs
    # [:horizontal, :vertical, :diagonal]
  end
end

#CHESS PIECE EMOJI ASCII:
#http://www.i2symbol.com/symbols/chess
