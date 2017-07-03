require './lib/simple_computer'

class PerfectComputer

  attr_reader :marker

  EARLIEST_CHANCE_TO_WIN = 11
  STARTING_DEPTH = 0
  MAXIMUM_DEPTH_TO_CHECK = 6
  MAXIMUM_SCORE = 1000

  def initialize(marker)
    @marker = marker
  end

  def choose_space(board)
    @best_score = {}
    negamax(board)
    @best_score.size > EARLIEST_CHANCE_TO_WIN ? choose_random_space(board) : best_space_to_pick
  end

  private

  def negamax(board, depth = STARTING_DEPTH, alpha = -MAXIMUM_SCORE, beta = MAXIMUM_SCORE, color = 1, max_depth = MAXIMUM_DEPTH_TO_CHECK)
    return color * score_scenarios(board, depth) if board.game_over? || depth > max_depth

    max = -MAXIMUM_SCORE

    board.check_available_spaces.each do |space|
      new_board = board.place_marker(space)
      negamax_value = -negamax(new_board, depth+1, -beta, -alpha, -color)
      max = [max, negamax_value].max
      @best_score[space] = max if depth == STARTING_DEPTH
      alpha = [alpha, negamax_value].max
      return alpha if alpha >= beta
    end

    max
  end

  def score_scenarios(board, depth)
    return 0 if board.game_tied?
    return MAXIMUM_SCORE / depth if board.game_won_by?(marker)
    return -MAXIMUM_SCORE / depth
  end

  def best_space_to_pick
    @best_score.max_by {|key, value| value}[0]
  end

  def choose_random_space(board)
    SimpleComputer.new(board.current_player_marker).choose_space(board)
  end

end

