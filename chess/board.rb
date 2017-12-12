require_relative 'piece'

class Board
  attr_reader :grid
  def initialize
    null_boy =  NullPiece.instance
    @grid = Array.new(8) { Array.new(8) { null_boy } }
    @grid[0].each_index {|i| @grid[0][i] = Piece.new([0,i], self) }
    @grid[1].each_index {|i| @grid[1][i] = Piece.new([1,i], self) }
    @grid[6].each_index {|i| @grid[6][i] = Piece.new([6,i], self) }
    @grid[7].each_index {|i| @grid[7][i] = Piece.new([7,i], self) }
  end

  def [](pos)
    @grid[pos[0]][pos[1]]
  end

  def move_piece(start_pos, end_pos)
    piece = self[start_pos]
    if piece.nil?
      raise StandardError.new("There is no piece at start_pos")
    end
    unless piece.moves.include?(end_pos)
      raise StandardError.new("#{end_pos} is not a valid move!  ")
    end
  end
end
