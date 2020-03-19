class HumanPlayer
  attr_reader :mark

  def initialize(mark, console, board)
    @mark = mark
    @console = console
    @board = board
  end

  def move
    @console.print_message("Player #{@mark}, please enter a position 1-9 that is not already marked")
    index = @console.retrieve_user_input.to_i - 1
    @board.valid_move?(index) ? index : move
  end
end
