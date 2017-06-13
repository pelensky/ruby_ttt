class Game

  attr_reader :board, :player1, :player2, :current_player, :winner

  def initialize(board, player1, player2)
    @board = board
    @player1 = player1
    @player2 = player2
    @current_player = player1
  end

  def take_turn
    @board.place_marker(@current_player.choose_available_space(@board.check_available_spaces), @current_player.marker)
    change_turns
  end

  def check_space(space)
    @board.check_space(space)
  end

  def game_over?
    game_tied? || game_won_by?(@player1) || game_won_by?(@player2)
  end

  private

  def change_turns
    @current_player == @player1 ? @current_player = @player2 : @current_player = @player1
  end

  def space_available?(space)
    @board.check_available_spaces.include? space
  end

  def game_tied?
    @board.check_available_spaces.empty?
  end

  def game_won_by?(player)
    @board.split_into_lines.any? do |line|
      set_winner(player) if line.all? {|space| space == player.marker}
    end
  end

  def set_winner(player)
    @winner = player
  end

end
