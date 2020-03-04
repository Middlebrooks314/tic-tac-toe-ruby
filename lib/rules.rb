require_relative 'board'

module Rules

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

  def self.game_over?(board)
    winning_combination?(board) || check_for_draw(board)

    # board.full?
  end

  def self.winning_combination?(board)
    WINNING_COMBOS.any? do |x, y, z|
      board.position_taken?(x) &&
      board.squares[x] == board.squares[y] &&
      board.squares[x] == board.squares[z]
    end
  end

  def self.check_for_draw(board)
    winning_combination?(board) == false && board.full? == true
  end
end
