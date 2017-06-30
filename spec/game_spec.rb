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
      allow(cli).to receive(:place_marker) { 3 }
      allow(cli).to receive(:get_valid_input) { 3 }
      game.take_turn
      expect(game.current_player.marker).to eq "O"
    end
  end

end
