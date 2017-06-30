
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
      new_board = board.place_marker(1)
      expect(new_board.spaces[1]).to eq "X"
    end

  end

  context "The board" do
    it "checks available spaces" do
      expect(board.space_available?(5)).to be true
    end

    it "tracks available spaces for a normal board" do
      new_board = board.place_marker(0)
      expect(new_board.check_available_spaces).to eq [1, 2, 3, 4, 5, 6, 7, 8]
    end

    it "tracks available spaces for a big board" do
      new_big_board = big_board.place_marker(15)
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
      board.place_marker(1)
      expect(board.spaces[1]).to eq 1
    end
  end

   context "The game is over when" do
    it "all spaces are filled"  do
      board = Board.new(["X","O","X","O","O","X","X","X","O"])
      expect(board.game_over?).to be true
    end

    it "player 1 wins" do
      board = Board.new(["X",1,"O","X","O",5,"X","O","X"])
      expect(board.game_over?).to be true
      expect(board.winner).to eq "X"
    end

    it "player 1 wins - big" do
      board = Board.new(["X",1,2,3,"O","X",6,7,8,"O","X",11,12,13,"O","X"])
      expect(board.game_over?).to be true
      expect(board.winner).to eq "X"
    end

    it "player 2 wins" do
      board = Board.new(["X","X","O",3,"O","X","O",7,8])
      expect(board.game_over?).to be true
      expect(board.winner).to eq "O"
    end

    it "player 2 wins - big" do
      board = Board.new(["X",1,2,"O",4,"X",6,"O",8,9,"X","O",12,13,"X","O"])
      expect(board.game_over?).to be true
      expect(board.winner).to eq "O"
    end

   it "not tied when board is empty" do
     board = Board.new([0,1,2,3,4,5,6,7,8])
     expect(board.game_tied?).to be false
   end

   it "not tied when spaces available" do
     board = Board.new(["X","O","X","X","O","O","O","X",8])
     expect(board.game_tied?).to be false
   end

   it "the game is tied" do
     board = Board.new(["X","O","X","X","O","O","O","X","X"])
     expect(board.game_tied?).to be true
   end

   it "the game is not tied when won and not spaces available" do
     board = Board.new(["X","O","X","X","X","O","X","O","O"])
    expect(board.game_tied?).to be false
   end


   it "the game is when not won and spaces are not available - big" do
     board = Board.new(["X","O","X","X","O","X","O","O","X","O","X","O","X","O","X","O"])
      expect(board.game_tied?).to be true
   end
  end

   context "Find marker" do
     it "has X play first" do
       expect(board.find_marker).to eq "X"
     end

     it "has O play next" do
       board = Board.new(["X",1,2,3,4,5,6,7,8])
       expect(board.find_marker).to eq "O"
     end

     it "has X play third" do
       board = Board.new(["X","O",2,3,4,5,6,7,8])
       expect(board.find_marker).to eq "X"
     end

   end
end
