class PerfectComputer

  attr_reader :marker

  def initialize(marker)
    @marker = marker
  end

  def choose_space(game)
    @best_score = {}
    negamax(game)
    @best_score.size > 11 ? choose_random_space(game) : best_space_to_pick
  end

  private

  def negamax(game, depth = 0, alpha = -1000, beta = 1000, color = 1, max_depth = 6)
    return color * score_scenarios(game, depth) if game.game_over? || depth > max_depth

    max = -1000

    game.board.check_available_spaces.each do |space|
      game.board.place_marker(space, game.current_player.marker)
      game.change_turns
      negamax_value = -negamax(game, depth+1, -beta, -alpha, -color)
      game.board.place_marker(space, space)
      game.change_turns
      max = [max, negamax_value].max
      @best_score[space] = max if depth == 0
      alpha = [alpha, negamax_value].max
      return alpha if alpha >= beta
    end
    max
  end

  def score_scenarios(game, depth)
    return 0 if game.game_tied?
    return 1000 / depth if game.game_won_by?(self)
    return -1000 / depth
  end

  def best_space_to_pick
    @best_score.max_by {|key, value| value}[0]
  end

  def choose_random_space(game)
    game.board.check_available_spaces.sample
  end

end

