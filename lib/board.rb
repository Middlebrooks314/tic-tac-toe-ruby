class Board
  def initialize
    @board = [' ', ' ', ' ', ' ', ' ', ' ', ' ', ' ', ' ']
  end

  def board_string

    expected_output  = " #{@board[0]} | #{@board[1]} | #{@board[2]} \n"
    expected_output += "-----------\n"
    expected_output += " #{@board[3]} | #{@board[4]} | #{@board[5]} \n"
    expected_output += "-----------\n"
    expected_output +  " #{@board[6]} | #{@board[7]} | #{@board[8]} \n"
  end

  def position_taken?(index)
    @board[index] != ' '
  end

  def mark_board(index, char = 'X')
    @board[index] = char
  end
end
