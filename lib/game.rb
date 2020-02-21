class Game
  def initialize
    @board = [' ', ' ', ' ', ' ', ' ', ' ', ' ', ' ', ' ']
  end

  def welcome
    puts 'Hello, welcome to Tic Tac Toe.'
    move
  end

  def display_board
    puts " #{@board[0]} | #{@board[1]} | #{@board[2]} "
    puts '-----------'
    puts " #{@board[3]} | #{@board[4]} | #{@board[5]} "
    puts '-----------'
    puts " #{@board[6]} | #{@board[7]} | #{@board[8]} "
  end

  def move
    display_board
    index = input_to_index(retrieve_user_input)
    position_taken?(index) ? move : mark_board(index)
    display_board
  end

  def retrieve_user_input
    puts 'Please enter a number 1-9'
    gets.strip
  end

  def input_to_index(user_input)
    user_input.to_i - 1
  end

  def position_taken?(index)
    @board[index] != ' '
  end

  def mark_board(index, char = 'X')
    @board[index] = char
  end
end
