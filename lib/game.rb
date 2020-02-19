class Game
  def welcome
    puts 'Hello, welcome to Tic Tac Toe.'
    turn
  end

  def display_board(board)
    puts " #{board[0]} | #{board[1]} | #{board[2]} "
    puts '-----------'
    puts " #{board[3]} | #{board[4]} | #{board[5]} "
    puts '-----------'
    puts " #{board[6]} | #{board[7]} | #{board[8]} "
  end

  def turn
    puts 'Please enter a number 1-9'
    user_input = gets.strip
    puts user_input
  end
end
