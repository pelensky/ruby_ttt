class PerfectComputer

  attr_reader :marker

  EARLIEST_CHANCE_TO_WIN = 11
  STARTING_DEPTH = 0
  MAXIMUM_DEPTH_TO_CHECK = 6
  MAXIMUM_SCORE = 1000

  def initialize(marker)
    @marker = marker
  end

  def choose_space(game)
    @best_score = {}
    negamax(game)
    @best_score.size > EARLIEST_CHANCE_TO_WIN ? choose_random_space(game) : best_space_to_pick
  end

  private

  def negamax(game, depth = STARTING_DEPTH, alpha = -MAXIMUM_SCORE, beta = MAXIMUM_SCORE, color = 1, max_depth = MAXIMUM_DEPTH_TO_CHECK)
    return color * score_scenarios(game, depth) if game.game_over? || depth > max_depth

    max = -MAXIMUM_SCORE

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
    return MAXIMUM_SCORE / depth if game.game_won_by?(self)
    return -MAXIMUM_SCORE / depth
  end

  def best_space_to_pick
    @best_score.max_by {|key, value| value}[0]
  end

  def choose_random_space(game)
    game.board.check_available_spaces.sample
  end

end

