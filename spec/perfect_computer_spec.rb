require 'perfect_computer'

RSpec.describe PerfectComputer do
  subject(:computer) { described_class.new("X") }

  context "The computer" do
    it "selects the only available space" do
      game = setup(["X","O","O","O","O","X","X","X",9])
      expect(computer.choose_space(game)).to eq 9
    end

    xit "blocks a win" do
      game = setup(["X","X","O",4,"O","X",7,8,9])
      expect(computer.choose_space(game)).to eq 7
    end
  end

  def setup(board_state)
    board = Board.new(board_state)
    player2 = PerfectComputer.new("O")
    Game.new(board, computer, player2)
  end

end
