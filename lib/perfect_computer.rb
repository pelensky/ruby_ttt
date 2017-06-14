class PerfectComputer

  attr_reader :marker

  def initialize(marker)
    @marker = marker
  end

  def choose_space(game)
    @best_score = {}
    negamax(game)
    @best_score.max_by {|key, value| value}[0]
  end

  private

  def negamax(game, depth = 0, alpha = -1000, beta = -1000, color = 1)
    return color * score_scenarios(game, depth) if game.game_over?

    best_value = -1000

    game.board.check_available_spaces.each do |space|
      game.board.place_marker(space, game.current_player.marker)
      game.change_turns

      negamax_value = -negamax(game, depth + 1, -beta, -alpha, -color)

      game.board.place_marker(space, space)
      game.change_turns

      best_value = negamax_value if negamax_value > best_value
      alpha = negamax_value if negamax_value > alpha
      @best_score[space] = best_value if depth == 0
      alpha if alpha >= beta
    end

    best_value

  end

  def score_scenarios(game, depth)
    return 0 if game.game_tied?
    return 1000 / depth
  end

end

