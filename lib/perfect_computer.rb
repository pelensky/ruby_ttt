class PerfectComputer

  attr_reader :marker

  def initialize(marker)
    @marker = marker
  end

  def choose_available_space(available_spaces)
    available_spaces.sample
  end

end
