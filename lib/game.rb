require_relative 'board'

class Game
  def initialize
    @board = Board.new
  end

  def welcome
    puts 'Hello, welcome to Tic Tac Toe.'
    play
  end

  def play
    @board.display_board
    index = input_to_index(retrieve_user_input)
    @board.position_taken?(index) ? play : @board.mark_board(index)
    @board.display_board
  end

  def retrieve_user_input
    puts 'Please enter a number 1-9'
    gets.strip
  end

  def input_to_index(user_input)
    user_input.to_i - 1
  end
end
