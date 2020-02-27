class Board
  def initialize
    @board = [' ', ' ', ' ', ' ', ' ', ' ', ' ', ' ', ' ']
  end

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
end
