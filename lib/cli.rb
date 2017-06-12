class CLI

  def initialize(input=$stdin, output=$stdout)
    @input = input
    @output = output
    run_app
  end

  private

  def run_app
    print_welcome
  end

  def print_welcome
    @output.puts "Tic Tac Toe"
  end
end
