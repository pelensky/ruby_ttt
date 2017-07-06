class WebPlayer

  attr_reader :marker

  def initialize(marker, move)
    @marker = marker
    @move = move
  end

  def choose_space(board)
    @move.pop if board.check_available_spaces.include? @move[0]
  end

end
