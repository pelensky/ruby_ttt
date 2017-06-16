require 'board'

RSpec.describe Board do

  subject(:board) { described_class.new((1..9).to_a) }
  subject(:big_board) { described_class.new((1..16).to_a) }

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

  context "The board" do
    it "tracks available spaces for a normal board" do
      board.place_marker(1, "X")
      expect(board.check_available_spaces).to eq [2, 3, 4, 5, 6, 7, 8, 9]
    end

    it "tracks available spaces for a big board" do
      big_board.place_marker(16, "X")
      expect(big_board.check_available_spaces).to eq [1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12,13, 14, 15]
    end

    it "can be split into rows - normal" do
      expect(board.split_into_lines).to include [1,2,3], [4,5,6], [7,8,9]
    end

    it "can be split into rows - big" do
      expect(big_board.split_into_lines).to include [1,2,3,4], [5,6,7,8], [9,10,11,12], [13,14,15,16]
    end

    it "can be split into columns - normal" do
      expect(board.split_into_lines).to include [1,4,7], [2,5,8], [3,6,9]
    end

    it "can be split into columns - big" do
      expect(big_board.split_into_lines).to include [1,5,9,13], [2,6,10,14], [3,7,11,15], [4,8,12,16]
    end

    it "can be split into diagonals - normal" do
      expect(board.split_into_lines).to include [1,5,9], [7,5,3]
    end

    it "can be split into diagonals - big" do
      expect(big_board.split_into_lines).to include [1,6,11,16], [13,10,7,4]
    end
  end
end
