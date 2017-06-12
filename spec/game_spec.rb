require 'game'
require 'board'
require 'player'

RSpec.describe Game do
  board = Board.new(3)
  player1 = Player.new("X")
  player2 = Player.new("O")
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

  context "A user can" do
    it "place their marker" do
      game.take_turn(1)
      expect(game.check_space(1)).to eq "X"
    end
  end
end
