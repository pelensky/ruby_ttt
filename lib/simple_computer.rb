class SimpleComputer

  attr_reader :marker

  def initialize(marker)
    @marker = marker
  end

  def choose_space(board)
    board.check_available_spaces.sample
  end

end
