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
      cli = setup_app("1")
      expect(output.string).to include("Tic Tac Toe")
    end
  end

end
