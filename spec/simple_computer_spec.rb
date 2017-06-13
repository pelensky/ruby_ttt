require 'simple_computer'

RSpec.describe SimpleComputer do
  subject(:computer) { described_class.new }

  context "The computer" do
    it "selects a random number from the available spaces" do
      possible_moves = [1,2,3,4,5,6,7,8,9]
      expect(possible_moves).to include computer.take_turn(possible_moves)
    end
  end
end
