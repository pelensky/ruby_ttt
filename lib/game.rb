class Game

  attr_reader :board, :player1, :player2, :current_player, :winner

  def initialize(board, player1, player2)
    @board = board
    @player1 = player1
    @player2 = player2
    @current_player = player1
  end

  def take_turn
    @board = @board.place_marker(@current_player.choose_space(self), @current_player.marker)
    change_turns
  end

  def game_over?
    game_tied? || game_won_by?(@player1) || game_won_by?(@player2)
  end

  private

  def change_turns
    string_count = @board.spaces.count { |space| space.is_a? String }
    @current_player = string_count.even? ? player1 : player2
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
