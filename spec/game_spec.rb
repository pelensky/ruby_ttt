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
    it "place their marker in an available space" do
      game.take_turn(1)
      expect(game.check_space(1)).to eq "X"
    end

    it "not place their marker in a taken space" do
      game.take_turn(1)
      game.take_turn(1)
      expect(game.check_space(1)).to eq "X"
    end
  end

  context "After a valid move" do
    it "changes the current player" do
      game.take_turn(9)
      expect(game.current_player.marker).to eq "O"
    end
  end

  context "The game is over when" do
    it "all spaces are filled"  do
      game.take_turn(1)
      game.take_turn(5)
      game.take_turn(3)
      game.take_turn(2)
      game.take_turn(8)
      game.take_turn(9)
      game.take_turn(7)
      game.take_turn(4)
      game.take_turn(6)
      expect(game.game_over?).to be true
    end
  end
end
