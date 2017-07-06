class WebPlayer

  attr_reader :marker

  def initialize(marker, move)
    @marker = marker
    @move = move
  end

  def choose_space(board)
    @move.pop
  end

end
