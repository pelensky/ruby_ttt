require 'game'
require 'board'
require 'human_player_cli'

RSpec.describe Game do
  let (:board) { Board.new(Array.new(9)) }
  let (:cli) { double('cli') }
  let (:player1) { HumanPlayer.new("X", cli) }
  let (:player2) { HumanPlayer.new("O", cli) }
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
      allow(cli).to receive(:place_marker) { 3 }
      allow(cli).to receive(:get_valid_input) { 3 }
      game.take_turn
      expect(game.current_player.marker).to eq "O"
    end
  end

end
