require 'simple_computer'
require 'board'
require 'game'

RSpec.describe SimpleComputer do
  subject(:computer) { described_class.new("X") }

    context "The computer" do
      it "selects the only available space" do
        board = Board.new(["X","O","O","O","O","X","X","X",9])
        expect(computer.choose_space(board)).to eq 9
      end

      it "selects a random available space" do
        available_spaces = [1,2,3,4,5,6,7,8,9]
        board = Board.new(available_spaces)
        expect(available_spaces).to include computer.choose_space(board)
      end
    end

end
