require 'board'

RSpec.describe Board do

  subject(:board) { described_class.new(Array.new(9)) }
  subject(:big_board) { described_class.new(Array.new(16)) }
  subject(:tied_board) { described_class.new(["X","O","X","X","O","O","O","X","X"]) }
  subject(:tied_big_board) { described_class.new(["X","O","X","X","O","X","O","O","X","O","X","O","X","O","X","O"]) }

  context "At setup it" do

    it "creates an array of spaces" do
      expect(board.spaces).to eq [nil, nil, nil, nil, nil, nil, nil, nil, nil]
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
      expect(tied_board.split_into_lines).to include ["X","O","X"], ["X","O","O"], ["O","X","X"]
    end

    it "can be split into rows - big" do
      expect(tied_big_board.split_into_lines).to include ["X","O","X","X"], ["O","X","O","O"], ["X","O","X","O"], ["X","O","X","O"]
    end

    it "can be split into columns - normal" do
      expect(tied_board.split_into_lines).to include ["X","X","O"], ["O","O","X"], ["X","O","X"]
    end

    it "can be split into columns - big" do
      expect(tied_big_board.split_into_lines).to include ["X","O","X","X"], ["O","X","O","O"], ["X","O","X","X"], ["X","O","O","O"]
    end

    it "can be split into diagonals - normal" do
      expect(tied_board.split_into_lines).to include ["X","O","X"], ["X","O","O"]
    end

    it "can be split into diagonals - big" do
      expect(tied_big_board.split_into_lines).to include ["X","X","X","O"], ["X","O","O","X"]
    end
  end

  context "Immutibility - The board" do
    it "doesn't override itself" do
      board.place_marker(1)
      expect(board.spaces[1]).to eq nil
    end
  end

   context "The game is over when" do
    it "all spaces are filled"  do
      board = Board.new(["X","O","X","O","O","X","X","X","O"])
      expect(board.game_over?).to be true
    end

    it "player 1 wins" do
      board = Board.new(["X",nil,"O","X","O",nil,"X","O","X"])
      expect(board.game_over?).to be true
      expect(board.winner).to eq "X"
    end

    it "player 1 wins - big" do
      board = Board.new(["X",1,2,3,"O","X",6,7,8,"O","X",11,12,13,"O","X"])
      expect(board.game_over?).to be true
      expect(board.winner).to eq "X"
    end

    it "player 2 wins" do
      board = Board.new(["X","X","O",nil,"O","X","O",nil,nil])
      expect(board.game_over?).to be true
      expect(board.winner).to eq "O"
    end

    it "player 2 wins - big" do
      board = Board.new(["X",1,2,"O",4,"X",6,"O",8,9,"X","O",12,13,"X","O"])
      expect(board.game_over?).to be true
      expect(board.winner).to eq "O"
    end

   it "not tied when board is empty" do
     expect(board.game_tied?).to be false
   end

   it "not tied when spaces available" do
     board = Board.new(["X","O","X","X","O","O","O","X",nil])
     expect(board.game_tied?).to be false
   end

   it "the game is tied" do
     expect(tied_board.game_tied?).to be true
   end

   it "the game is not tied when won and not spaces available" do
     board = Board.new(["X","O","X","X","X","O","X","O","O"])
    expect(board.game_tied?).to be false
   end


   it "the game is when not won and spaces are not available - big" do
      expect(tied_big_board.game_tied?).to be true
   end
  end

   context "Find marker" do
     it "has X play first" do
       expect(board.current_player_marker).to eq "X"
     end

     it "has O play next" do
       board = Board.new(["X",nil,nil,nil,nil,nil,nil,nil,nil])
       expect(board.current_player_marker).to eq "O"
     end

     it "has X play third" do
       board = Board.new(["X","O",nil,nil,nil,nil,nil,nil,nil])
       expect(board.current_player_marker).to eq "X"
     end

   end
end
