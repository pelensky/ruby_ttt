require 'game'
require 'board'
require 'player'

RSpec.describe Game do
  let (:board) { Board.new(3) }
  let (:cli) { double('cli') }
  let (:player1) { Player.new("X", cli) }
  let (:player2) { Player.new("O", cli) }
  subject(:game) { described_class.new(board, player1, player2) }

  context "At setup, the game" do

    it "is initialized with a board" do
      expect(game.board).to eq board
    end

    it "it initialized with two players" do
      expect(game.player1).to eq player1
      expect(game.player2).to eq player2
    end

    it "has a starting player of X" do
      expect(game.current_player).to eq player1
    end

  end

  context "After a valid move" do
    it "changes the current player" do
      allow(cli).to receive(:choose_available_space) { 3 }
      game.take_turn
      expect(game.current_player.marker).to eq "O"
    end
  end

   context "The game is over when" do
    it "all spaces are filled"  do
      game.board.spaces = ["X","O","X","O","O","X","X","X","O"]
      expect(game.game_over?).to be true
    end

    it "player 1 wins" do
      game.board.spaces = ["X",2,"O","X","O",6,"X","O","X"]
      expect(game.game_over?).to be true
      expect(game.winner).to eq player1
    end

    it "player 2 wins" do
      game.board.spaces = ["X","X","O",4,"O","X","O",8,9]
    expect(game.game_over?).to be true
    expect(game.winner).to eq player2
    end
  end

end
