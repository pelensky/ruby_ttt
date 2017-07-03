require 'simple_computer'
require 'board'
require 'game'

RSpec.describe SimpleComputer do
  subject(:computer) { described_class.new("X") }

    context "The computer" do
      it "selects the only available space" do
        board = Board.new(["X","O","O","O","O","X","X","X",nil])
        expect(computer.choose_space(board)).to eq 8
      end

      it "selects a random available space" do
        board = Board.new(Array.new(9, nil))
        expect((0..8).to_a).to include computer.choose_space(board)
      end
    end

end
