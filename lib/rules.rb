require_relative 'board'

class Rules
  def initialize(board)
    @board = board
  end

  def game_over?
    @board.winning_combination? || @board.full?
  end
end
