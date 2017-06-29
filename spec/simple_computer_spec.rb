require 'simple_computer'
require 'board'
require 'game'

RSpec.describe SimpleComputer do
  subject(:computer) { described_class.new("X") }

    context "The computer" do
      it "selects the only available space" do
        game = setup(["X","O","O","O","O","X","X","X",9])
        expect(computer.choose_space(game)).to eq 9
      end

      it "selects a random available space" do
        available_spaces = [1,2,3,4,5,6,7,8,9]
        game = setup(available_spaces)
        expect(available_spaces).to include computer.choose_space(game)
      end
    end

  def setup(board_state)
    board = Board.new(board_state)
    player2 = SimpleComputer.new("O")
    Game.new(board, computer, player2)
  end

end
