require_relative 'board'
require_relative 'game'

class Rules
  def initialize(board)
    @board = board
  end

  WINNING_COMBOS = [
    [0, 1, 2],
    [3, 4, 5],
    [6, 7, 8],
    [0, 3, 6],
    [1, 4, 7],
    [2, 5, 8],
    [0, 4, 8],
    [2, 4, 6]
]

  def game_over?
    winning_combination? || check_for_draw?
  end

  def winning_combination?
    WINNING_COMBOS.any? do |x, y, z|
      @board.position_taken?(x) &&
      @board.squares[x] == @board.squares[y] &&
      @board.squares[x] == @board.squares[z]
    end
  end

  def check_for_draw?
    winning_combination? == false && @board.full? == true
  end
end
