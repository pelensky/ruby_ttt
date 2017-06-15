require 'cli'
require 'stringio'

RSpec.describe CLI do

  let(:output) { StringIO.new }

  def setup_app(input_string)
    input = StringIO.new(input_string)
    CLI.new(input, output)
  end

  context "On launch the app" do
    it "welcomes the user" do
      setup_app("2\n2\n")
      expect(output.string).to include "Tic Tac Toe"
    end

    it "checks if player one is a human or computer" do
      setup_app("2\n2\n")
      expect(output.string).to include "Choose player type for X\n1) Human\n2) Simple Computer\n3) Expert Computer"
    end

    it "tells X it is their turn" do
      setup_app("2\n2\n")
      expect(output.string).to include "X, take your turn"
    end

    it "tells O it is their turn" do
      setup_app("2\n2\n")
      expect(output.string).to include "O, take your turn"
    end

    it "prints the board" do
      setup_app("2\n2\n")
      expect(output.string).to include(" 1 | 2 | 3\n" +
                                       "-" * 10 +
                                      "\n 4 | 5 | 6\n" +
                                      "-" * 10 +
                                      "\n 7 | 8 | 9")
    end

    it "shows the user the board after taking their turn" do
      setup_app("1\n1\n1\n5\n3\n2\n8\n9\n7\n4\n6\n")
      expect(output.string).to include(" X | 2 | 3\n" +
                                       "-" * 10 +
                                      "\n 4 | 5 | 6\n" +
                                      "-" * 10 +
                                      "\n 7 | 8 | 9")
    end

    it "prints invalid selection when the user selects the wrong thing" do
      setup_app("1\n1\n1\n5\n3\n2\n8\n1\n9\n7\n4\n6\n")
      expect(output.string).to include "Invalid Selection"
    end

    it "goes on until the game has been tied" do
      setup_app("1\n1\n1\n5\n3\n2\n8\n9\n7\n4\n6\n")
      expect(output.string).to include "Game Over"
      expect(output.string).to include "Tied Game"
    end

    it "results in a tie if two perfect players play together" do
      setup_app("3\n3\n")
      expect(output.string).to include "Tied Game"
    end

    it "goes on until the game has been won" do
      setup_app("1\n1\n1\n5\n9\n3\n7\n8\n4\n")
      expect(output.string).to include "X is the winner"
    end
  end

end
