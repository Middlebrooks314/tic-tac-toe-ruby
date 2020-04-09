class ComputerPlayer
  attr_reader :mark

  def initialize(mark, board, display)
    @board = board
    @display = display
    @mark = mark
  end

  def move
    @display.make_move_message(@mark)
    index = retrieve_computer_index
    computer_is_thinking
    @board.valid_move?(index) ? @board.mark(index, @mark) : move
  end

  private

  def computer_is_thinking
    @display.computer_thinking
    sleep 1
  end

  def retrieve_computer_index
    available_move = @board.available_moves
    available_move.sample
  end
end
