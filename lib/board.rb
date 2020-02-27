class Board
  def initialize
    @board = [' ', ' ', ' ', ' ', ' ', ' ', ' ', ' ', ' ']
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

  def display
    <<-HEREDOC
 #{@board[0]} | #{@board[1]} | #{@board[2]}
-----------
 #{@board[3]} | #{@board[4]} | #{@board[5]}
-----------
 #{@board[6]} | #{@board[7]} | #{@board[8]}
    HEREDOC
  end

  def position_taken?(index)
    @board[index] != ' '
  end

  def mark_board(index, mark = 'X')
    @board[index] = mark
  end

  def full_board?
    @board.all? do |index|
      index != ' '
    end
  end

  def winning_combination?
    WINNING_COMBOS.any? do |combo|
      position_taken?(combo[0]) &&
      @board[combo[0]] == @board[combo[1]] &&
      @board[combo[0]] == @board[combo[2]]
    end
  end
end
