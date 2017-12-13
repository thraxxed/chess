require_relative 'piece'

class Board
  attr_reader :grid
  def initialize
    @null_boy = NullPiece.instance
    @grid = Array.new(8) { Array.new(8) { @null_boy } }
    @grid[0].each_index {|i| @grid[0][i] = Queen.new([0,i], self, 1) }
    @grid[1].each_index {|i| @grid[1][i] = Rook.new([1,i], self, 1) }
    @grid[6].each_index {|i| @grid[6][i] = Rook.new([6,i], self, 2) }
    @grid[7].each_index {|i| @grid[7][i] = Queen.new([7,i], self, 2) }
  end

  def [](pos)
    row, col = pos
    @grid[row][col]
  end

  def []=(pos, piece)
    @grid[pos[0]][pos[1]] = piece
  end

  def move_piece(start_pos, end_pos)
    piece = self[start_pos]
    if piece.is_a?(NullPiece)
      raise StandardError.new("There is no piece at start_pos")
    end
    unless piece.valid_moves.include?(end_pos)
      raise StandardError.new("#{end_pos} is not a valid move!  ")
    end
    #make the move
    self[end_pos] = self[start_pos]
    self[start_pos] = @null_boy
  end
end
