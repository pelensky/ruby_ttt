class Board

  attr_reader :spaces

  def initialize(number_of_spaces)
    @number_of_spaces = number_of_spaces
    @spaces = (1..9).to_a
  end

end
