class Game

  attr_reader :board, :player1, :player2, :current_player

  def initialize(board, player1, player2)
    @board = board
    @player1 = player1
    @player2 = player2
    @current_player = player1
  end

  def take_turn(space)
    if space_available?(space)
      @board.place_marker(space, @current_player.marker)
      change_turns
    end
  end

  def check_space(space)
    @board.check_space(space)
  end

  def game_over?
    @board.check_available_spaces.empty?
  end

  private

  def change_turns
    @current_player == @player1 ? @current_player = @player2 : @current_player = @player1
  end

  def space_available?(space)
    @board.check_available_spaces.include? space
  end

end
