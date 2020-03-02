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
    winning_combination?(board) || board.full?
  end

  def self.winning_combination?(board)
    WINNING_COMBOS.any? do |combo|
      board.position_taken?(combo[0]) &&
      board.squares[combo[0]] == board.squares[combo[1]] &&
      board.squares[combo[0]] == board.squares[combo[2]]
    end
  end
end
