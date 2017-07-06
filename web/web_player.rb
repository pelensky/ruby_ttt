class WebPlayer

  attr_reader :marker

  def initialize(marker, move_queue)
    @marker = marker
    @move_queue = move_queue
  end

  def choose_space(board)
    @move_queue.pop
  end

end
