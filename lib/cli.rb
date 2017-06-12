class CLI

  def initialize(input=$stdin, output=$stdout)
    @input = input
    @output = output
    run_app
  end

  private

  def run_app
    print_welcome
    setup_game
    print_board
  end

  def setup_game
    board = Board.new(3)
    player1 = Player.new("X")
    player2 = Player.new("O")
    @game = Game.new(board, player1, player2)
  end

  def print_welcome
    @output.puts "Tic Tac Toe"
  end

  def print_board
    @output.puts  " 1 | 2 | 3\n" +
                  "-" * 9 +
                  "\n 4 | 5 | 6\n" +
                  "-" * 9 +
                  "\n 7 | 8 | 9"
  end

end
