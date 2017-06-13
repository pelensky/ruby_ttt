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
      setup_app("1\n5\n3\n2\n8\n9\n7\n4\n6\n")
      expect(output.string).to include "Tic Tac Toe"
    end

    it "tells X it is their turn" do
      setup_app("1\n5\n3\n2\n8\n9\n7\n4\n6\n")
      expect(output.string).to include "X, take your turn"
    end

    it "tells O it is their turn" do
      setup_app("1\n5\n3\n2\n8\n9\n7\n4\n6\n")
      expect(output.string).to include "O, take your turn"
    end

    it "prints the board" do
      setup_app("1\n5\n3\n2\n8\n9\n7\n4\n6\n")
      expect(output.string).to include(" 1 | 2 | 3\n" +
                                       "-" * 10 +
                                      "\n 4 | 5 | 6\n" +
                                      "-" * 10 +
                                      "\n 7 | 8 | 9")
    end

    it "shows the user the board after taking their turn" do
      setup_app("1\n5\n3\n2\n8\n9\n7\n4\n6\n")
      expect(output.string).to include(" X | 2 | 3\n" +
                                       "-" * 10 +
                                      "\n 4 | 5 | 6\n" +
                                      "-" * 10 +
                                      "\n 7 | 8 | 9")
    end

    it "goes on until the game has been tied" do
      setup_app("1\n5\n3\n2\n8\n9\n7\n4\n6\n")
      expect(output.string).to include "Game Over"
    end
  end

end
