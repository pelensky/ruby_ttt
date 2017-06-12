class Board

  OFFSET = 1

  attr_reader :spaces

  def initialize(number_of_spaces)
    @number_of_spaces = number_of_spaces
    @spaces = (1..9).to_a
  end

  def place_marker(space, marker)
    @spaces[space - OFFSET] = marker
  end

end
