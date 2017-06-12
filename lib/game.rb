class Game

  attr_reader :board, :player1, :player2, :current_player

  def initialize(board, player1, player2)
    @board = board
    @player1 = player1
    @player2 = player2
    @current_player = player1
  end

  def take_turn(space)
    @board.place_marker(space, @current_player.marker)
  end

  def check_space(space)
    @board.check_space(space)
  end

end
