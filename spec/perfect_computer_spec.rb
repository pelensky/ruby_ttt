require 'perfect_computer'
require 'board'
require 'game'

RSpec.describe PerfectComputer do
  subject(:computer) { described_class.new("X") }
  subject(:computer_o) { described_class.new("O") }

  context "The computer" do
    it "selects the only available space" do
      board = Board.new(["X","O","O","O","O","X","X","X",nil])
      expect(computer.choose_space(board)).to eq 8
    end

    it "blocks a win - X" do
      board = Board.new(["X","X","O",nil,"O","X",nil,nil,"O"])
      expect(computer.choose_space(board)).to eq 6
    end

    it "blocks a win - O" do
      board = Board.new(["X",nil,"O",nil,"X","X",nil,nil,"O"])
      expect(computer_o.choose_space(board)).to eq 3
    end

    it "wins the game vertically- X" do
      board = Board.new(["X","O","X",nil,"O",nil,"O",nil,"X"])
      expect(computer.choose_space(board)).to eq 5
    end

    it "wins the game diagonally - X" do
      board = Board.new(["X",nil,nil,"O","X",nil,nil,"O",nil])
      expect(computer.choose_space(board)).to eq 8
    end

    it "wins the game horizontally - X" do
      board = Board.new(["X","X",nil,"O","O",nil,nil,nil,nil])
      expect(computer.choose_space(board)).to eq 2
    end

    it "wins the game - O" do
      board = Board.new(["X",nil,"X","X",nil,nil,"O",nil,"O"])
      expect(computer_o.choose_space(board)).to eq 7
    end

    it "wins the game again - O" do
      board = Board.new(["X",nil,"O",nil,nil,nil,"X","X","O"])
      expect(computer_o.choose_space(board)).to eq 5
    end

      it "selects a random available space at the start of the game" do
        board = Board.new(Array.new(9,nil))
        expect((0..15).to_a).to include computer.choose_space(board)
      end
    end

  end
