require_relative 'board'
require_relative 'console'
require 'pry'
class Game
  def initialize(board, console)
    @board = board
    @console = console
  end

  def welcome
    'Welcome to Tic Tac Toe'
  end

  def play
    @console.print_message(@board.board_string)
    @console.print_message(puts 'Please enter a number 1-9')
    index = @console.retrieve_user_input.to_i - 1
    @board.position_taken?(index) ? play : @board.mark_board(index)
    @console.print_message(@board.board_string)
  end
end
