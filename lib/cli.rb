require_relative 'game'
require_relative 'board'
require_relative 'player'

class CLI

  def initialize(input=$stdin, output=$stdout)
    @input = input
    @output = output
    run_app
  end

  def choose_available_space(available_spaces)
    choice = @input.gets.chomp.to_i
    if available_spaces.include? choice
      choice
    else
      @output.puts "Invalid Selection"
    end
  end

  private

  def run_app
    print_start_of_game
    until @game.game_over?
      single_turn
    end
    print_outcome
  end

  def setup_game
    board = Board.new(3)
    player1 = Player.new("X", self)
    player2 = Player.new("O", self)
    @game = Game.new(board, player1, player2)
  end

  def print_start_of_game
    print_welcome
    setup_game
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

end
