require 'perfect_computer'
require 'board'
require 'game'

RSpec.describe PerfectComputer do
  subject(:computer) { described_class.new("X") }
  subject(:computer_o) { described_class.new("O") }

  context "The computer" do
    it "selects the only available space" do
      board = Board.new(["X","O","O","O","O","X","X","X",8])
      expect(computer.choose_space(board)).to eq 8
    end

    it "blocks a win - X" do
      board = Board.new(["X","X","O",3,"O","X",6,7,"O"])
      expect(computer.choose_space(board)).to eq 6
    end

    it "blocks a win - O" do
      board = Board.new(["X",1,"O",3,"X","X",6,7,"O"])
      expect(computer_o.choose_space(board)).to eq 3
    end

    it "wins the game vertically- X" do
      board = Board.new(["X","O","X",3,"O",5,"O",7,"X"])
      expect(computer.choose_space(board)).to eq 5
    end

    it "wins the game diagonally - X" do
      board = Board.new(["X",1,2,"O","X",5,6,"O",8])
      expect(computer.choose_space(board)).to eq 8
    end

    it "wins the game horizontally - X" do
      board = Board.new(["X","X",2,"O","O",5,6,7,8])
      expect(computer.choose_space(board)).to eq 2
    end

    it "wins the game - O" do
      board = Board.new(["X",1,"X","X",4,5,"O",7,"O"])
      expect(computer_o.choose_space(board)).to eq 7
    end

    it "wins the game again - O" do
      board = Board.new(["X",1,"O",3,4,5,"X","X","O"])
      expect(computer_o.choose_space(board)).to eq 5
    end
  end

  def setup_for_player1(board_state)
    board = Board.new(board_state)
    player2 = PerfectComputer.new("O")
    Game.new(board, computer, player2)
  end


  def setup_for_player2(board_state)
    board = Board.new(board_state)
    player1 = PerfectComputer.new("X")
    Game.new(board, player1, computer_o)
  end

end
