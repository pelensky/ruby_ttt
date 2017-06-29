class Game

  attr_reader :board, :player_x, :player_o, :current_player, :winner

  def initialize(board, player_x, player_o)
    @board = board
    @player_x = player_x
    @player_o = player_o
    @current_player = player_x
  end

  def take_turn
    @board = @board.place_marker(@current_player.choose_space(self), @current_player.marker)
    change_turns
  end

  def game_over?
    game_tied? || game_won_by?(@player_x) || game_won_by?(@player_o)
  end

  def game_tied?
    if @board.check_available_spaces.empty? && !game_won_by?(@player_x) && !game_won_by?(@player_o)
      @winner = nil
      true
    else
      false
    end
  end

  def change_turns
    string_count = @board.spaces.count { |space| space.is_a? String }
    @current_player = string_count.even? ? @player_x : @player_o
  end

  def game_won_by?(player)
    @board.split_into_lines.any? do |line|
      set_winner(player) if line.all? {|space| space == player.marker}
    end
  end

  private

  def set_winner(player)
    @winner = player
  end

end
