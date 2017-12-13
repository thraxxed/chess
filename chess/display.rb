require 'colorize'
require_relative 'board'
require_relative 'cursor'

class Display
  attr_reader :cursor
  def initialize(board)
    @board = board
    @cursor = Cursor.new([0, 0], @board)
  end

  def render
    system("clear")
    print "    0   1   2   3   4   5   6   7\n   "
    8.times {print "----"}
    @board.grid.each_with_index do |row, i|
      print "\n#{i} |"
      row.each_with_index do |pos, j|
        str = " #{pos.symbol} " if pos.is_a?(Piece)
        str =  " * " if pos.is_a?(NullPiece)
        str = str.green if @cursor.cursor_pos == [i,j]
        str += "|"
        print str
      end
      print "\n   "
      8.times {print "----"}
    end
    print "\n"
  end
end
