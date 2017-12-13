module SlidingPiece
  def moves
    # puts @pos
    differentials = move_dirs
    moves = []
    differentials.each do |diff|
      moves << [@pos[0]+diff[0],@pos[1]+diff[1]]
    end

    #reject moves which are off of the board

    moves.reject do |move|
      move[0] < 0 || move[0] > 7 || move[1] < 0 || move[1] > 7
    end



  end

  private

  def move_dirs
    raise "This should never be called!"
    self.move_dirs
  end

  def vertical_dirs
    vertical_dirs = []
    #checking positions below the piece
    (1..7).each do |i|
      piece_at_pos = @board[ [ @pos[0]+i, @pos[1] ] ]
      break if @pos[0] + i > 7
      #break unless @board[@pos[0]+i, @pos[1]].is_a?(NullPiece)
      if piece_at_pos.is_a?(NullPiece)
        vertical_dirs << [i, 0]
      else #spot is another piece (not null)
        if piece_at_pos.player == @player
          break
        else #piece at this spot is on the other team, valid spot
          vertical_dirs << [i, 0]
          break
        end
      end
    end

    #checking positions to the left
    (1..7).each do |i|
      piece_at_pos = @board[ [ @pos[0]-i, @pos[1] ] ]
      break if @pos[0] - i < 0
      #break unless @board[@pos[0]+i, @pos[1]].is_a?(NullPiece)
      if piece_at_pos.is_a?(NullPiece)
        vertical_dirs << [-i, 0]
      else #spot is another piece (not null)
        if piece_at_pos.player == @player
          break
        else #piece at this spot is on the other team, valid spot
          vertical_dirs << [-i, 0]
          break
        end
      end
    end
    vertical_dirs
  end

  def horizontal_dirs
    horizontal_dirs = []
    (1..7).each do |i|
      #checking spaces right of the piece
      piece_at_pos = @board[ [ @pos[0], @pos[1]+i ] ]
      break if @pos[1] + i > 7
      #break unless @board[@pos[0]+i, @pos[1]].is_a?(NullPiece)
      if piece_at_pos.is_a?(NullPiece)
        horizontal_dirs << [0, i]
      else #spot is another piece (not null)
        puts piece_at_pos.class
        if piece_at_pos.player == @player
          break
        else #piece at this spot is on the other team, valid spot
          horizontal_dirs << [0, i]
          break
        end
      end
    end

    (1..7).each do |i|
      #checking spaces left of the piece
      piece_at_pos = @board[ [ @pos[0], @pos[1]-i ] ]
      break if @pos[1] - i < 0
      if piece_at_pos.is_a?(NullPiece)
        horizontal_dirs << [0, -i]
      else #spot is another piece (not null)
        if piece_at_pos.player == @player
          break
        else #piece at this spot is on the other team, valid spot
          horizontal_dirs << [0, -i]
          break
        end
      end
    end
    horizontal_dirs
  end

  def diagonal_dirs
    diagonal_dirs = []
    (1..7).each do |i|
      # checking down and right
      break if @pos[0] + i > 7 or @pos[1] + i > 7
      piece_at_pos = @board[ [@pos[0] + i, @pos[1] + i] ]
      if piece_at_pos.is_a?(NullPiece)
        diagonal_dirs << [i, i]
      else
        if piece_at_pos.player == @player
          break
        else
          diagonal_dirs << [i, i]
          break
        end
      end
    end

    (1..7).each do |i|
      # checking down and left
      break if @pos[0] + i > 7 or @pos[1] - i < 0
      piece_at_pos = @board[ [@pos[0] + i, @pos[1] - i] ]
      if piece_at_pos.is_a?(NullPiece)
        diagonal_dirs << [i, -i]
      else
        if piece_at_pos.player == @player
          break
        else
          diagonal_dirs << [i, -i]
          break
        end
      end
    end

    (1..7).each do |i|
      # checking up and right
      break if @pos[0] - i < 0 or @pos[1] + i > 7
      piece_at_pos = @board[ [@pos[0] - i, @pos[1] + i] ]
      if piece_at_pos.is_a?(NullPiece)
        diagonal_dirs << [-i, i]
      else
        if piece_at_pos.player == @player
          break
        else
          diagonal_dirs << [-i, i]
          break
        end
      end
    end

    (1..7).each do |i|
      # checking up and left
      break if @pos[0] - i < 0 or @pos[1] - i < 0
      piece_at_pos = @board[ [@pos[0] - i, @pos[1] - i] ]
      if piece_at_pos.is_a?(NullPiece)
        diagonal_dirs << [-i, -i]
      else
        if piece_at_pos.player == @player
          break
        else
          diagonal_dirs << [-i, -i]
          break
        end
      end
    end

    diagonal_dirs
  end
    # (1..7).each do |i|
    #   diagonal_dirs << [i, i]
    #   diagonal_dirs << [i, i * -1]
    #   diagonal_dirs << [i * -1, i]
    #   diagonal_dirs << [-1 * i, -1 * i]
    # end

end

module SteppingPiece
  def z
    puts "z"
  end
end
