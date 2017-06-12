require 'player'

RSpec.describe Player do

  subject(:player) { described_class.new("X") }

  context "At setup, a player" do

    it "is initialized with a marker" do
      expect(player.marker).to eq "X"
    end

  end

end
