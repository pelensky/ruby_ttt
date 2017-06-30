require 'board'

RSpec.describe Board do

  subject(:board) { described_class.new((0..8).to_a) }
  subject(:big_board) { described_class.new((0..15).to_a) }

  context "At setup it" do

    it "creates an array of spaces" do
      expect(board.spaces).to eq (0..8).to_a
    end
  end

  context "A user can" do

    it "place a marker in a space" do
      new_board = board.place_marker(1, "X")
      expect(new_board.check_space(1)).to eq "X"
    end

  end

  context "The board" do
    it "checks available spaces" do
      expect(board.space_available?(5)).to be true
    end

    it "tracks available spaces for a normal board" do
      new_board = board.place_marker(0, "X")
      expect(new_board.check_available_spaces).to eq [1, 2, 3, 4, 5, 6, 7, 8]
    end

    it "tracks available spaces for a big board" do
      new_big_board = big_board.place_marker(15, "X")
      expect(new_big_board.check_available_spaces).to eq [0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12,13, 14]
    end

    it "can be split into rows - normal" do
      expect(board.split_into_lines).to include [0,1,2], [3,4,5], [6,7,8]
    end

    it "can be split into rows - big" do
      expect(big_board.split_into_lines).to include [0,1,2,3], [4,5,6,7], [8,9,10,11], [12,13,14,15]
    end

    it "can be split into columns - normal" do
      expect(board.split_into_lines).to include [0,3,6], [1,4,7], [2,5,8]
    end

    it "can be split into columns - big" do
      expect(big_board.split_into_lines).to include [0,4,8,12], [1,5,9,13], [2,6,10,14], [3,7,11,15]
    end

    it "can be split into diagonals - normal" do
      expect(board.split_into_lines).to include [0,4,8], [6,4,2]
    end

    it "can be split into diagonals - big" do
      expect(big_board.split_into_lines).to include [0,5,10,15], [12,9,6,3]
    end
  end

  context "Immutibility - The board" do
    it "doesn't override itself" do
      board.place_marker(1, "X")
      expect(board.check_space(1)).to eq 1
    end
  end
end
