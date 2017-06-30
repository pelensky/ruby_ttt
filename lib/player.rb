class Player

  attr_reader :marker

  def initialize(marker, ui)
    @marker = marker
    @ui = ui
  end

  def choose_space(game)
    @ui.place_marker(game.board.check_available_spaces)
  end
end
