class Player

  attr_reader :marker

  def initialize(marker, ui)
    @marker = marker
    @ui = ui
  end

  def choose_space(game)
    @ui.get_valid_input(game.board.check_available_spaces)
  end
end
