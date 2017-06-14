require_relative 'game'
require_relative 'board'
require_relative 'player'
require_relative 'simple_computer'

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

  def setup_board
    Board.new((1..9).to_a)
  end

  def choose_player(marker)
    print_choose_player(marker)
    get_valid_input([1,2]) == 1 ? Player.new(marker, self) : SimpleComputer.new(marker)
  end

  def setup_game(board, player1, player2)
    @game = Game.new(board, player1, player2)
  end

  def start_of_game
    print_welcome
    board = setup_board
    player1 = choose_player("X")
    player2 = choose_player("O")
    setup_game(board, player1, player2)
    print_board
  end

  def single_turn
    print_players_turn
    take_turn
    print_board
  end

  def print_welcome
    @output.puts "Tic Tac Toe"
  end

  def print_players_turn
    @output.puts "#{@game.current_player.marker}, take your turn"
  end

  def print_board
    split_board = @game.board.spaces.each_slice(3)
    split_board.each_with_index do |row, row_index|
      single_row = ""
      row.each_with_index do |space, space_index|
        if space_index == split_board.size - 1
          single_row += " #{space}"
        else
          single_row += " #{space} |"
        end
      end
      if row_index == row.size - 1
          @output.puts single_row
      else
          @output.puts single_row + "\n" + "-" * single_row.length
      end
    end
  end

  def print_game_over
    @output.puts "Game Over"
  end

  def take_turn
    @game.take_turn
  end

  def print_outcome
    print_game_over
    @output.puts @game.winner ? "#{@game.winner.marker} is the winner" : "Tied Game"
  end

  def print_choose_player(marker)
    @output.puts "Choose player type for #{marker}"
    @output.puts "1) Human"
    @output.puts "2) Simple Computer"
  end

end
