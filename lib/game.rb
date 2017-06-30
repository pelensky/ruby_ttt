class Game

  attr_reader :board, :player_x, :player_o, :current_player, :winner

  def initialize(board, player_x, player_o)
    @board = board
    @player_x = player_x
    @player_o = player_o
    @current_player = player_x
  end

  def take_turn
    @board = @board.place_marker(@current_player.choose_space(@board))
    change_turns
  end

  def change_turns
    string_count = @board.spaces.count { |space| space.is_a? String }
    @current_player = string_count.even? ? @player_x : @player_o
  end

  def game_over?
    @board.game_over?
  end

end
