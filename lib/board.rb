class Board

  attr_accessor :spaces, :number_of_rows

  def initialize(spaces)
    @spaces = spaces
    @number_of_rows = Math.sqrt(spaces.count)
  end

  def place_marker(space, marker)
    spaces = @spaces.dup
    spaces[space] = marker
    Board.new(spaces)
  end

  def check_space(space)
    @spaces[space]
  end

  def check_available_spaces
    @spaces.select {|space| space_available?(space)}
  end

  def space_available?(space)
    space.is_a? Integer
  end

  def split_into_lines
    lines = []
    split_into_rows.each {|row| lines.push(row)}
    split_into_columns.each{|column| lines.push(column)}
    split_into_diagonals.each{|diagonal| lines.push(diagonal)}
    lines
  end

  def game_over?
    game_tied? || game_won_by?("X") || game_won_by?("O")
  end

  def game_tied?
    if check_available_spaces.empty? && !game_won_by?("X") && !game_won_by?("O")
      @winner = nil
      true
    else
      false
    end
  end

  private

  def split_into_rows
    @spaces.each_slice(@number_of_rows).to_a
  end

  def split_into_columns
    split_into_rows.transpose
  end

  def split_into_diagonals
    diagonals = []
    diagonals.push(split_left_diagonal, split_right_diagonal)
  end

  def split_left_diagonal
    (0..@number_of_rows - 1).map {|position| split_into_rows[position][position]}
  end

  def split_right_diagonal
    (0..@number_of_rows - 1).map {|position| split_into_rows.reverse[position][position]}
  end

  def game_won_by?(marker)
    split_into_lines.any? do |line|
      set_winner(marker) if line.all? {|space| space == marker}
    end
  end

  def set_winner(marker)
    @winner = marker
  end
end
