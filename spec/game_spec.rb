require 'game'
require 'board'
require 'player'

RSpec.describe Game do
  let (:board) { Board.new(3) }
  let (:player1) { Player.new("X", double('cli')) }
  let (:player2) { Player.new("O", double('cli')) }
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
      take_multiple_turns([1,1])
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
      take_multiple_turns([1,5,3,2,8,9,7,4,6])
      expect(game.game_over?).to be true
    end

    it "player 1 wins" do
      take_multiple_turns([1,5,9,3,7,8,4])
      expect(game.game_over?).to be true
      expect(game.winner).to eq player1
    end

    it "player 2 wins" do
    take_multiple_turns([1,5,2,3,6,7])
    expect(game.game_over?).to be true
    expect(game.winner).to eq player2
    end
  end

   def take_multiple_turns(moves)
     moves.each {|space| game.take_turn(space)}
   end
end
