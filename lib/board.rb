class Board

  OFFSET = 1

  attr_accessor :spaces

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

  def split_into_lines
    lines = []
    split_into_rows.each {|row| lines.push(row)}
    split_into_columns.each{|column| lines.push(column)}
    split_into_diagonals.each{|diagonal| lines.push(diagonal)}
    lines
  end


  private

  def split_into_rows
    @spaces.each_slice(3).to_a
  end

  def split_into_columns
    split_into_rows.transpose
  end

  def split_into_diagonals
    diagonals = []
    diagonals.push(split_left_diagonal, split_right_diagonal)
  end

  def split_left_diagonal
    (0..@number_of_spaces - 1).map {|position| split_into_rows[position][position]}
  end

  def split_right_diagonal
    (0..@number_of_spaces - 1).map {|position| split_into_rows.reverse[position][position]}
  end
end
