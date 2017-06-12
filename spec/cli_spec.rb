require 'game'
require 'board'
require 'player'
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
      setup_app("1")
      expect(output.string).to include("Tic Tac Toe")
    end

    it "gives player 1 the chance to go first" do
      setup_app("1")
      expect(output.string).to include(" 1 | 2 | 3\n" +
                                       "-" * 9 +
                                      "\n 4 | 5 | 6\n" +
                                      "-" * 9 +
                                      "\n 7 | 8 | 9")
    end
  end

end
