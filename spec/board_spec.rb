require 'board'

RSpec.describe Board do

  subject(:board) { described_class.new(3) }

  context "At setup it" do

    it "creates an array of spaces" do
      expect(board.spaces).to eq (1..9).to_a
    end
  end

  context "A user can" do

    it "place a marker in a space" do
      board.place_marker(1, "X")
      expect(board.check_space(1)).to eq "X"
    end

  end
end
