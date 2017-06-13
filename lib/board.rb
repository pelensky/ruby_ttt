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

  def check_space(space)
    @spaces[space - OFFSET]
  end

  def check_available_spaces
    @spaces.select {|space| space.is_a? Integer}
  end


end
