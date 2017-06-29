require 'game'
require 'board'
require 'player'
require 'simple_computer'
require 'perfect_computer'

class CLI

  def initialize(input=$stdin, output=$stdout)
    @input = input
    @output = output
    run_app
  end

  def get_valid_input(options)
    choice = @input.gets.chomp.to_i
    if options.include? choice
      choice
    else
      @output.puts "Invalid Selection"
      get_valid_input(options)
    end
  end

  private

  def run_app
    start_of_game
    until @game.game_over?
      single_turn
    end
    print_outcome
  end

  def start_of_game
    clear_screen
    print_welcome
    board = setup_board
    player1 = choose_player("X")
    player2 = choose_player("O")
    setup_game(board, player1, player2)
  end

  def single_turn
    clear_screen
    print_board
    print_players_turn
    take_turn
  end

  def setup_board
    print_board_size
    choice = get_valid_input([3,4])
    return Board.new((1..(choice*choice)).to_a)
  end

  def choose_player(marker)
    clear_screen
    print_choose_player(marker)
    choice = get_valid_input([1,2,3])
    return Player.new(marker, self) if choice == 1
    return SimpleComputer.new(marker) if choice == 2
    return PerfectComputer.new(marker) if choice == 3
  end

  def setup_game(board, player1, player2)
    @game = Game.new(board, player1, player2)
  end

  def print_welcome
    @output.puts "Tic Tac Toe"
  end

  def print_players_turn
    @output.puts "#{@game.current_player.marker}, take your turn"
  end

  def print_board
    split_board = @game.board.spaces.each_slice(@game.board.number_of_rows)
    split_board.each_with_index do |row, row_index|
      single_row = ""
      row.each_with_index do |space, space_index|
        offset_space = space.to_s.length == 1 ? "#{space} " : "#{space}"
        if space_index == split_board.size - 1
          single_row += " #{offset_space}"
        else
          single_row += " #{offset_space} |"
        end
      end
      @output.puts row_index == row.size - 1 ? single_row : single_row + "\n" + "-" * single_row.length
    end
  end

  def take_turn
    @game.take_turn
  end

  def print_game_over
    @output.puts "Game Over"
  end

  def print_outcome
    clear_screen
    print_game_over
    print_board
    @output.puts @game.winner ? "#{@game.winner.marker} is the winner" : "Tied Game"
  end

  def print_choose_player(marker)
    @output.puts "Choose player type for #{marker}"
    @output.puts "1) Human"
    @output.puts "2) Simple Computer"
    @output.puts "3) Expert Computer"
  end

  def print_board_size
    @output.puts "Choose the number of rows on the board"
    @output.puts "Select 3 or 4"
  end

  def clear_screen
    @output.puts "\e[2J\e[f"
  end

end
