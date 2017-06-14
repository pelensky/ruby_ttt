class Player

  attr_reader :marker

  def initialize(marker, ui)
    @marker = marker
    @ui = ui
  end

  def choose_available_space(available_spaces)
    @ui.get_valid_input(available_spaces)
  end
end
