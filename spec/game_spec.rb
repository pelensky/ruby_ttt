require 'game'
require 'board'
require 'player'

RSpec.describe Game do
  let (:board) { Board.new((0..8).to_a) }
  let (:cli) { double('cli') }
  let (:player1) { Player.new("X", cli) }
  let (:player2) { Player.new("O", cli) }
  subject(:game) { described_class.new(board, player1, player2) }

  context "At setup, the game" do

    it "is initialized with a board" do
      expect(game.board).to eq board
    end

    it "it initialized with two players" do
      expect(game.player_x).to eq player1
      expect(game.player_o).to eq player2
    end

    it "has a starting player of X" do
      expect(game.current_player).to eq player1
    end

  end

  context "After a valid move" do
    it "changes the current player" do
      allow(cli).to receive(:choose_available_space) { 3 }
      allow(cli).to receive(:get_valid_input) { 3 }
      game.take_turn
      expect(game.current_player.marker).to eq "O"
    end
  end

   context "The game is over when" do
    it "all spaces are filled"  do
      game = setup(["X","O","X","O","O","X","X","X","O"])
      expect(game.game_over?).to be true
    end

    it "player 1 wins" do
      game = setup(["X",1,"O","X","O",5,"X","O","X"])
      expect(game.game_over?).to be true
      expect(game.winner).to eq player1
    end

    it "player 1 wins - big" do
      game = setup(["X",1,2,3,"O","X",6,7,8,"O","X",11,12,13,"O","X"])
      expect(game.game_over?).to be true
      expect(game.winner).to eq player1
    end

    it "player 2 wins" do
      game = setup(["X","X","O",3,"O","X","O",7,8])
      expect(game.game_over?).to be true
      expect(game.winner).to eq player2
    end

    it "player 2 wins - big" do
      game = setup(["X",1,2,"O",4,"X",6,"O",8,9,"X","O",12,13,"X","O"])
      expect(game.game_over?).to be true
      expect(game.winner).to eq player2
    end
  end

   it "not tied when board is empty" do
     game = setup([0,1,2,3,4,5,6,7,8])
     expect(game.game_tied?).to be false
   end

   it "not tied when spaces available" do
     game = setup(["X","O","X","X","O","O","O","X",8])
     expect(game.game_tied?).to be false
   end

   it "the game is tied" do
     game = setup(["X","O","X","X","O","O","O","X","X"])
     expect(game.game_tied?).to be true
   end

   it "the game is not tied when won and not spaces available" do
      game = setup(["X","O","X","X","X","O","X","O","O"])
      expect(game.game_tied?).to be false
   end


   it "the game is when not won and spaces are not available - big" do
     game = setup(["X","O","X","X","O","X","O","O","X","O","X","O","X","O","X","O"])
      expect(game.game_tied?).to be true
   end


   def setup(board)
      Game.new(Board.new(board), player1, player2)
   end
end
