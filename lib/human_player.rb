class HumanPlayer
  attr_reader :mark

  def initialize(mark, board, display)
    @board = board
    @display = display
    @mark = mark
  end

  def move
    @display.make_move_message(@mark)
    index = @display.retrieve_user_input.to_i - 1
    @board.valid_move?(index) ? @board.mark(index, @mark) : move
  end
end
