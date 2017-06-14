require 'perfect_computer'

RSpec.describe PerfectComputer do
  subject(:computer) { described_class.new("X") }
  subject(:computer_o) { described_class.new("O") }

  context "The computer" do
    it "selects the only available space" do
      game = setup(["X","O","O","O","O","X","X","X",9])
      expect(computer.choose_space(game)).to eq 9
    end

    it "blocks a win - X" do
      game = setup(["X","X","O",4,"O","X",7,8,9])
      expect(computer.choose_space(game)).to eq 7
    end

    xit "blocks a win - O" do
      game = setup(["X",2,"O",4,"X","X",7,8,"O"])
      expect(computer_o.choose_space(game)).to eq 4
    end

    it "wins the game - X" do
      game = setup(["X","O","X",4,"O",6,"O",8,"X"])
      expect(computer.choose_space(game)).to eq 6
    end

    it "wins the game diagonally - X" do
      game = setup(["X",2,3,"O","X",6,7,"O",9])
      expect(computer.choose_space(game)).to eq 9
    end

    xit "wins the game - O" do
      game = setup(["X",2,"X","X",5,6,"O",8,"9"])
      expect(computer.choose_space(game)).to eq 8
    end
  end

  def setup(board_state)
    board = Board.new(board_state)
    player2 = PerfectComputer.new("O")
    Game.new(board, computer, player2)
  end

end
