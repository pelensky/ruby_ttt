require 'perfect_computer'

RSpec.describe PerfectComputer do
  subject(:computer) { described_class.new("X") }

  context "The computer" do
    it "selects the only available space" do
      possible_moves = [9]
      expect(possible_moves).to include computer.choose_available_space(possible_moves)
    end
  end
end
